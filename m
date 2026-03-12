Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9C9386423
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 15:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773327907; cv=none; b=TPFb676MHBzRuq6S3hCOLwh4oKHqEerx0u8QStZQPbfn2oaKhXJisBS2eiF6LJavVpEhJPqfaV4ID2gYlIil3lzLzwY0GjlsX/AjitIfTp7jmakMPH68PkQBAALavSGQ9OhR7rulLCnSMJVSGd/tSJfL9oKIiaGoNoxhxP3dexw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773327907; c=relaxed/simple;
	bh=Ou176iaKRapsXxPlFxmCOXeZg+hgHxa5jRA/hTxjWH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fSOFxyEMNjDHv76OS07mRS/x2QbwTjW/+w34yT7RrgHSNI5I/rRanBMcnlYDcGuu/Xb2P40paXcSo4xMbGUceaT2ogxrEvX21fhbOsr8HSzDuSW+8q4bfWEfv8jIpYeMDiso7h0VjpPjjtQgEmFE0BX09F9rNCipsjBUJptjcrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6lqU7Ri; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6lqU7Ri"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a12f88d839so1426088e87.0
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 08:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773327903; x=1773932703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sFoMkityIlWAkBj/ankUjCHQN4IX1we00551tFsNNnM=;
        b=j6lqU7RiNL1mvT/y+NVmJEaa9Si1jTdzA+1JQpwAQfraL/AeQmcEXO7zobo2V6G7bx
         Dh6KHzmBXZdwAWu/3J4TBh4m7pN3NvYrFk0VTgaCWy2XqTc7SsK5mf4jLbtUpCX9o7tt
         4cRKeiJc9RtcUJgKgY8FHiMePS7Ybjqes63lBo2cuQPQBXOAm3BX5D+oLqhK+ckA3HmC
         4UYZCdFik6Fe30ytjxwsiWuHhPrL0gE2KXLMuU9Hmz06ssfTVmWcazKQAV5KNeUucEfq
         iJFeVBShs7/0caXzqiMh8p+9S53CCeqoCuNOhtRJJMIKDipmi8kUV1QjlcdkElXI2Zq5
         ocdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773327903; x=1773932703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFoMkityIlWAkBj/ankUjCHQN4IX1we00551tFsNNnM=;
        b=Dv4vz14L7V0+am/kReSh7rIOizZoEoHDoX897wgLmFJHK75Sg6LIupWqxjRJOyg8dA
         npYwVzA+WIJLxQJ13aWyIQFhSUKjnNwdHXDsyGG86gkjwsNCaaKnab0iG/4qhnuK53kG
         wnnFYhgXw5kXEzzdN7PauwEBskBTOOwdU5v3j2WG2U9bUEoPERrX7XJCiBy54msEqBp6
         uvUjjWPLU0XPqXNX0+M4yfgnOQbLD8ddPQkXitKRf7+4/KHW8wJbzGWRQUVlaTgdXugI
         XLMWoscBozz8rsEyRpFr6u7+BiuWZ/LBO2LR55yeu5u1SaZyC97g/H9FHoFQyABycA/d
         VifQ==
X-Gm-Message-State: AOJu0YwA9DsJPuacYHsCxvEv3ZER20hxdZiSlCRicNFOEunZ2y0orWvw
	M4KzC0sikoSL/7BtsRHMfyipE6ssXqx1bsR8qOi3qcvmjl6EWjw6dN4UiBwKzlOBVTM=
X-Gm-Gg: ATEYQzzl4M2Q9F77buDaPeJc9Wg9DBZQ5GDL7loUH4+rnA0DazvnEmvA1m39JKcHzHK
	ML0HNNkhEg3VhcxOjwlmlUFkdOvVqxAiW4xQep1Wjip2Sh99c34MqHY0OmfdQVssOg6BqzDO4I9
	zQnUVeFYDLHije9jaLa2hrngi4QkHVv5kFwu8Dgmf5dYwEy0vFc83QE/R3s3bc7rbCIFS3lJ7ai
	sRpx4Ph1l3/3rEeeT+xtsu8zS2n7CnUEFau6kW0Dm2yaMHQR6Atuu0y7NwmnU+XV2FDDHiv4PCv
	as4X8+mqLJIMh6VBz5GgeoWbsXDwHjDbRgKIyLS7x5FlfHECWC6gxdjgpaFMkPaQbxE4rlWvBzU
	q+wJIpgM6ipkTPbg5Pnk7YKMj7QQrZggTGBvbZUl/l+8G2Z79MdCI4Fmja6KAOOYeWTL5CArCrA
	4Pu/rPuB0efEEqLxE+D/x7aDmAICFd3Q/FRi3TjQI=
X-Received: by 2002:a05:6512:2c0d:b0:5a1:37ab:312b with SMTP id 2adb3069b0e04-5a156bc2156mr2304776e87.15.1773327902998;
        Thu, 12 Mar 2026 08:05:02 -0700 (PDT)
Received: from gentoo.sknt.ru ([95.161.221.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156034364sm1000197e87.40.2026.03.12.08.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:05:02 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Tetsuya Nomura <tetsuya.nomura@soho-enterprise.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH 0/2] media: i2c: Add support for Sony IMX662 sensor
Date: Thu, 12 Mar 2026 18:04:35 +0300
Message-ID: <20260312150437.1091195-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces a V4L2 subdevice driver for the Sony IMX662 CMOS
image sensor. The IMX662 is a 1/2.8-inch sensor with a native pixel array
of 1936x1100 (effective 1920x1080) and up to 90 frames per second
(depending on the operating mode). It supports MIPI CSI-2 output with
2 or 4 data lanes, RAW10/RAW12 formats, and both colour and monochrome
variants.

The driver implements all standard controls (exposure, analogue gain,
horizontal/vertical blanking, flip, brightness) and runtime PM. It also
provides a selection API for cropping and supports multiple link
frequencies via device tree.

The driver is designed to be extensible: a V4L2_CID_HDR_SENSOR_MODE
control for Clear HDR modes is included, but these modes are not yet
operational. Future patches will complete the HDR support
(Clear HDR and Clear HDR + DOL2).

The driver has been tested on a ARM64 Rockchip RK3568 platform with a
24 MHz external clock and various link frequencies; image capture works
correctly and all controls behave as expected.

Alexander Shiyan (2):
  dt-bindings: media: i2c: Add Sony IMX662 sensor
  media: i2c: Add driver for Sony IMX662 sensor

 .../bindings/media/i2c/sony,imx662.yaml       |  112 ++
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx662.c                    | 1176 +++++++++++++++++
 4 files changed, 1300 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx662.yaml
 create mode 100644 drivers/media/i2c/imx662.c

-- 
2.52.0

