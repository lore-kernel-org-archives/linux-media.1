Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFF847D472
	for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 11:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041239; cv=none; b=I2A7lUGkwW+aoriCjikaDUSTkoj13yn6FuDltT0k9sczXcZhp6tJcJMJSrjg5+7UmlLGTabc/kqqLx1KGZV0HByvtk4Skfb0L4vOQqodQ+bT3kHcZLJVk9FPNGKho/fCkxzuvn5wUWSOr41AlLfTrQ4Vp8GUWRcePuKHnizthPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041239; c=relaxed/simple;
	bh=t3C5Fug6dA8Ig/dnotWxKnpFMQyKuhdsviGmTo7wejI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t1C6NvMjTfMQ0fFC6AJ9gXC5uhuX5o8qCSj4cZ1Hq9AZb4zRuNscyDwF7SJbrQ0sbTEWrgx3CTek38SViSgxcw49xy2Imd5BuL6/oSW6QZokGclWeJ8EK12S2Hogcu4/C1TnF4fI/fYlzF1jPsvdWIu8Ol7odPP+gfDrp3cZcbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SL6OQG87; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SL6OQG87"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so89159105e9.2
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 04:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789041230; x=1789646030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3C5Fug6dA8Ig/dnotWxKnpFMQyKuhdsviGmTo7wejI=;
        b=SL6OQG87H3PSWC/tD89aWiSO2AC06XYEij3J0evHi9CmzaeIx3aplnbrD8RCmoRszI
         Gl+Ywv8r4pTPwlLbhYnzbx/eRakRW3z/xQHvOnLMNvTMzWOMbT1vx+6GhI7D+xaVT/zV
         O5xPlNsAGmU+W2clYM/IYQcIUrpKPBDoxEid00k1bUXw43rAtr/MTkN2v0DrHhxMCChV
         cjPcQ4AQ9RcXZVRkw6Xspgca1jw6xzH2sPwlwT8bawyHrBPh5UskVNsXoEaEnLNtzUFi
         O9w6nDvg6HlqLNYo5pP5j3fjHd+rZtnn0iDJwMlsZxG6pQVt7UmtOHNvlrrOSQVSogqs
         4sFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789041230; x=1789646030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t3C5Fug6dA8Ig/dnotWxKnpFMQyKuhdsviGmTo7wejI=;
        b=snuqQQ8fujk1fWeV99A27Khh9kaFYtJdxSPGoR92CNgQTaCvRxcQI9qKa5UDD+0Yk0
         w0UDRBvNozdi274+cL9xx63Qij17NGdpZcVXdzwZbmooAEhfmA/zljQh7oBIlIe+pQDE
         4+AnGOLaty442wL6aCj4/kfottYLkCoTmXUi3uNRev/Lyg7h5GfX13ZNtKWY7fBP3HvS
         AYqjf87muM15i1P6vXrSifjaxsI35EsOQWRp0688Jn//FArM1BFbBA3pF3COFlzRPp/B
         996H61I4xnhT8Fb2IP1FLkVWXvSK9MZT8ZcyWKlVOgsL5+uIqJwLQfkq1+D49W/sn4hh
         YAyQ==
X-Forwarded-Encrypted: i=1; AKwUvByardzSBILiFYrNg0Nus44e60YRV8IP6zqQTkcW1xRhXcy5PuHwBJgfErLYG++ecO1JC2S1Lr6R4T5Emg==@vger.kernel.org
X-Gm-Message-State: AFuF++lhBOOp053cSqhkBQNU60iDZr1qkSzSEwv7xCgg+1vMWf79FgBd
	VVl7w7UnREh2nDhrak+3rq80j1wBY5YvIxbE/t3rxAdusOfF9QtzliB53CfVSPXi
X-Gm-Gg: AYBFou0hRrMGhs+cOJqOzqP9Er7UgYRPwPlDWTaXRT91EFzkOvHBKg69gcOqX3CDwy0
	ZRA0EMruJFGKD3uT7A1XR2n+ClPoFY7LLpSZk8VU4rc2dc/1Zn96TO/HmgHXjrcQtvpTPgMWxHk
	jMASirzFnzRJSxHi5UaK8lv+pCBkOFxSFid5jGaq+Pba19QHkVyfE7v2BPS+qvcxr2y84rCvUR2
	vcl6/gaUYUr7i4sNl4k9Zs6VOHgvieA/3Ox33QHT/HnfpavG5gnAbcnk1ULhk+8Goucx4Po0JIZ
	5IipU3DGya614YMTdhUB7ezDU+s4GPn659rMELbfk5/gJjGzw8tlEvNJV2mSZ0PRAfFJOsqvw/d
	S3uY9hj9Abw2qzvak0TWV+HzhMv4uf0uk17P5JM4ICavcwPEk/vApgq7Ky6/V4a/O1PoKK8vzWZ
	pLmZrRBThmOpANvtVbeLeRrx/AtOkAjd6JbSS1pRyZB9UPiF6sEPGNqAhYp4VlD7nxYHTDSW1Zz
	ndmBB2FBCX6ERXjQJAckMRgBPtOSbwKWX2AfGpEqRCBuEiJjrRQHjBVnKYsuzes
X-Received: by 2002:a05:600d:848e:20b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-49cf824f697mr298682635e9.10.1789041229934;
        Thu, 10 Sep 2026 04:53:49 -0700 (PDT)
Received: from cachyos-x8664 (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be64a5sm66654015e9.6.2026.09.10.04.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:53:49 -0700 (PDT)
From: German <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: andre.gilerson@gmail.com,
	conor+dt@kernel.org,
	dan.scally@ideasonboard.com,
	devicetree@vger.kernel.org,
	germanpapulindez@gmail.com,
	hansg@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Test on another machine and userspace for [PATCH v3 0/3] media: Add support for the Sony IMX681
Date: Thu, 10 Sep 2026 13:53:32 +0200
Message-ID: <20260910115332.7171-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910112210.44432-1-lsa.uz@pm.me>
References: <20260910112210.44432-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 Thanks for clarifying the origin of the errors
 I am more than happy to provide the tag
 Tested-by: German <germanpapulindez@gmail.com>
