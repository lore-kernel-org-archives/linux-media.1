Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3218235C6BE
	for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 22:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791758400; cv=none; b=Zpkv1J+J+dyGtNNIL48GfAkzZK7j3BS5SZgW352g2fAUsvqv5ERQI1jlUgu7I2hTQ8vTcX8bjHkDJp8fIk9jlzMSxGlF/0wHNxSAoeuCoTfwSOlFMcwBdWzYKSN/Z7w2KxTP22sd8GTg3+1dyO+f0KNzfr9jArPIqztm5xvkd/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791758400; c=relaxed/simple;
	bh=xm7zmmCmvA/Kz7KfL1R9Yqv2NSWneryvUBrSk9xgCDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qeepjrHdLz68v9PsIbPLx/xj7I66JezUXwGODB+e4XwfeVUBshwXv16btXwtpq0YRzgasxIseM+0xeSgRQ/JeB01EjK9kUFBXDgZkkf+5nxTzJ5iyPFIycBWeo8XTeCoBna7hFaQrfnpA5sQUuwGGEk3J3YlMtfL2FG8bSpwSVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aRsPZtzM; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aRsPZtzM"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afbd2c386so563322f8f.3
        for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 15:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791758396; x=1792363196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xwhYc9CDw7ZgP6emNisFG66EG4JKlhzFKT9RLmp7nJU=;
        b=aRsPZtzM/CVizgyW5uQCYGYegHyHSxJeYwd1/FhVlRqINvK+hBr3CqxoH7xfFQli+5
         dE8GFrQQX/R1ctL0DVZ0B/E2JCuaxOI7u09ahG+0jr0ZPkhM4Uf/rCch41mQ407bp9uQ
         +MXoyeS+tp/86Tnf3/vGwJhMHvqoaLJBk4b0DeQtfVLRtrg4iEK/yGS/uWfba4iaN/NV
         5st6YOpfeVGmXSzW28aHmMzWNnImutU7/DScP/VqSSkWNxyendDUeI7U/PGKnatC4Sab
         0d8i1SQu/xuawj/IzUun+xXldnlN1EhtjrDBhK6S8P6eBbCfoMkbJNwHm1tNTb6DuhNr
         fL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791758396; x=1792363196;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xwhYc9CDw7ZgP6emNisFG66EG4JKlhzFKT9RLmp7nJU=;
        b=gdJqv2QobLlVjTGwWkC13D0r46QSbfxsu4BAqylRbJGGq09eM21vFQlLVEjwKxAgro
         /YAZMAbxJOidDxjQGo/BT3cHvkEfm1iz45Fdyyc67yQHj3owsj5ts4kHIBbjpFR0cTQO
         9BVdmhew0GHe0kbr5AO7uud92X9TbS3V/LLSY4s7s/1Y0HV9xQ51P4yeL04wWeV/37Sd
         KfywQYsZ1H5yJTOCmHknLyjDUAssLJ1Os0KCEri5wMkb6Qik/ZJ+/HVlxiOSWOTRHCzz
         2AG43OnJ9036TUpPXKxYW49XVsHWDZBax2zbVx8G92en5bBBwMw5IYBQiXwxefjcjLP4
         NDkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbPWXY0xc7JSODLTr/ZPItzH9c+1CNoecYLg+E3Dy0IWaWq5mjtJGU5cTwwvo1Ntfpmuf1Cf0/aMPlog==@vger.kernel.org
X-Gm-Message-State: AFq9FYLNgvevlC30Vk4tf2yOYmaDEpN5o1/rX5FoNTLXoBqkVt5LmoGf
	9n3pdbQPCVUY+rm/d0BfFSJ4NDddmxbuH/3oHfhoOAMoxF3HqAelKjZ5sO+s00DcQlE=
X-Gm-Gg: AYBFou247ifD1aEdPMVT3I7qY680ddimI9IhHcql4/6F+jJpOzmZ5lZ33Q9RHZ9xLuQ
	fijplC3em1Fed1N3nJ0rQYVFvrX+WdVHEzaRrVsT/rxNkbhQtyuD83ALBru10fDa8oeFhilmxwO
	JJfARNXk2nbHLKNLmu04OyA43Kj6lFiARtgkXbKqP3FOqwNn5bFrd1o8j9ZfmWuz5+bBYSR7ulL
	GTHHmImKHmYuahYU4S4Sfs1d6ZELemOcA6lfXhUi97Urs2Ywy/sDgjM4JdG/5+qE6zqO266jmzQ
	3vPfdozVJ48cN/TaGaMj/HX0I8S/05/JLBWr/v+tPrcKdQKZCbjFTVUn1jK+DgCzy30yXo/WhVC
	HP0xeOMwm2l9w0ZnFnWbplP2QLjdPlcM0XbDEFa2+YPZptN0fBY4jgSLtKQK8qu/tc76KuwTNGE
	LTHhOXYS+d+qPUGUssnjYHWPjMaGWbJhkrdW/J0RsuAG9iBq3dOQxjwrrQlFQvtqfRsgwHjF/gl
	cQ8IvEHLANtTQ==
X-Received: by 2002:a05:6000:40e0:b0:48c:6a4d:3b67 with SMTP id ffacd0b85a97d-48dbaceb433mr14028801f8f.19.1791758396194;
        Sun, 11 Oct 2026 15:39:56 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.165.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9463a9dsm16723214f8f.6.2026.10.11.15.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 15:39:54 -0700 (PDT)
Message-ID: <5f238c7a-c17e-4127-afad-38eb2cea9c34@linaro.org>
Date: Sun, 11 Oct 2026 23:39:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] media: qcom: camss: Add streams API support for
 CSIPHY
To: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20260911062213.195007-2-gjorgji.rosikopulos@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260911062213.195007-2-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2026 07:22, 
Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
> From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
> 
> Add the V4L2 subdev streams API to the CSIPHY driver: a passthrough
> routing table (one VC per stream) and NO_STREAM_MIX routing validation.
> 
> enable/disable_streams pad ops track active streams per pad via a
> per-pad enabled_streams[] bitmask, so that multiple source-pad
> consumers can share a single propagated sink stream without redundant
> or colliding propagation to the sensor. The shared D-PHY lanes are
> enabled once, on the transition from no active streams to at least
> one, and disabled once all streams have gone idle.
> 
> This is opt-in per CSIPHY instance via the new streams_enable resource
> flag; no platform sets it yet, so CSIPHYs continue to use the legacy
> non-streams subdev ops unchanged.
> 
> Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
+ static const struct v4l2_subdev_core_ops csiphy_core_ops = {
+       .s_power = csiphy_set_power,
++>>>>>>> media: qcom: camss: Add streams API support for CSIPHY
   };

   static const struct v4l2_subdev_video_ops csiphy_video_ops = {
@@@ -932,17 -981,17 +1133,30 @@@ int msm_csiphy_register_entity(struct c
   {
         struct v4l2_subdev *sd = &csiphy->subdev;
         struct media_pad *pads = csiphy->pads;
++<<<<<<< HEAD
  +      struct camss *camss = csiphy->camss;
  +      struct device *dev = camss->dev;
  +      int ret;
  +
  +      if (camss->legacy_phy)
  +              v4l2_subdev_init(sd, &csiphy_v4l2_ops_legacy);
  +      else
  +              v4l2_subdev_init(sd, &csiphy_v4l2_ops);
  +
  +      sd->internal_ops = &csiphy_v4l2_internal_ops;
++=======
+       struct device *dev = csiphy->camss->dev;
+       bool streams_api = csiphy->res->streams_enable;
+       int ret;
+
+       v4l2_subdev_init(sd, streams_api ? &csiphy_streams_v4l2_ops
+                                             : &csiphy_v4l2_ops);
+       sd->internal_ops = streams_api ? &csiphy_streams_internal_ops
+                                       : &csiphy_v4l2_internal_ops;
++>>>>>>> media: qcom: camss: Add streams API support for CSIPHY
         sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+       if (streams_api)
+               sd->flags |= V4L2_SUBDEV_FL_STREAMS;
         snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
                  MSM_CSIPHY_NAME, csiphy->id);
         sd->grp_id = CSIPHY_GRP_ID;
@@@ -968,22 -1025,16 +1190,35 @@@
         ret = v4l2_device_register_subdev(v4l2_dev, sd);
         if (ret < 0) {
                 dev_err(dev, "Failed to register subdev: %d\n", ret);
++<<<<<<< HEAD
  +              goto media_entity_err;
  +      }
  +
  +      if (!IS_ERR(csiphy->phy)) {
  +              ret = phy_init(csiphy->phy);
  +              if (ret) {
  +                      dev_err(dev, "%s init fail %d\n", csiphy->name, 
ret);
  +                      v4l2_device_unregister_subdev(sd);
  +                      goto media_entity_err;
  +              }
  +      }
  +
  +      return 0;
  +
  +media_entity_err:
  +      media_entity_cleanup(&sd->entity);
++=======
+               goto err_v4l2_subdev_cleanup;
+       }
+
+       return 0;
+
+ err_v4l2_subdev_cleanup:
+       v4l2_subdev_cleanup(sd);
+ err_media_entity_cleanup:
+       media_entity_cleanup(&sd->entity);
+
++>>>>>>> media: qcom: camss: Add streams API support for CSIPHY
