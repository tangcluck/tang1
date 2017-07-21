package com.wsgw.base.utils;

import java.sql.Timestamp;
import java.util.Date;

import org.apache.commons.lang3.ArrayUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializeConfig;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.serializer.SimpleDateFormatSerializer;

public class JsonUtil {
	private final static SerializerFeature[] DEFAULT_FEATURES = {
			SerializerFeature.WriteMapNullValue,
			SerializerFeature.WriteNullListAsEmpty,
			// SerializerFeature.WriteNullNumberAsZero,
			SerializerFeature.WriteNullBooleanAsFalse,
			SerializerFeature.WriteNullStringAsEmpty,
			SerializerFeature.WriteDateUseDateFormat	};
	private static SerializeConfig DEFALULT_MAPPING = new SerializeConfig();

	static {
		DEFALULT_MAPPING.put(Date.class, new SimpleDateFormatSerializer(
				"yyyy-MM-dd"));
		DEFALULT_MAPPING.put(Timestamp.class, new SimpleDateFormatSerializer(
				"yyyy-MM-dd"));
	}
	public static String toJSONString(Object obj, SerializerFeature... features) {
		return JSON.toJSONString(obj, DEFALULT_MAPPING,
				(SerializerFeature[]) ArrayUtils.addAll(DEFAULT_FEATURES,
						features));
	}
}
