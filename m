Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF63942885A
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 20:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789765020; cv=none; b=flxia46higJm4B94NeVIc5PMyKIr6gTHR8VVdMck8l1GceOAdl3jfd5juhFqcCPnyGVDdJthDovGzWEcWKgUXmzv5BTBzOopm4pO7G49KQ9+0Xh4m9b3V2gh0m70QfCHNCO7QYr2MP4kEbkYWzduhLFrMlq3KlFyOG/uKP+CdiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789765020; c=relaxed/simple;
	bh=HSptCIBExwtcqPFuzpkLkpMIALhmv4dX8nFOYFbtYTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B8DmxwMINUls4cDZIAmbmr2EPeTMYd1xYbGPlt/vazLjvjyb4ktwyh5yUDlan23gI28HZP0PEoSf4YY1qF4/wKXMKdS3Oerix0EN290oRWyIeqUntO97BS3FVl+/qlE1si/SrjVTTf1bluNGr29bylZ6uQEWxHufraj47k4sWbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ZPTLOd8V; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ZPTLOd8V"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2dd9ec41bc4so4027655ad.2
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 13:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789765018; x=1790369818;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/Is2lUlBqSGMkpOZkUx2pau6e4D6+5AaH4X9SJHq0Dc=;
        b=xDrh604WyCQCVtsfavwTGYgyqGieThLFSYEwYfrhVaDd+w0KopRZKMtTIM9R8VevzS
         FXKvWBcTBicXxzASQVzDVG0dLJzKZmKXcf9oOHRRX/IQiHh0OZRT0F75btTQueP7SPro
         pwdg4Q9UnMOY0pvuEJ/J5lU2vJ+b3iY0Ag60sk+Qkk+dvE8h54KX2AGRScUrKdCv3otA
         +wrCCrytYgtx43iJUJgQc5i/dZCnXwXYdq5AY2yxr06FFtUS71k8m5qsbJgYUTYsMQOR
         39qYrwHZ0bXz9StQkkrsaXqe7mcGAyk8zCTIE7Pb7sZTzd10GR3tYJMZ2G471tCfO4Gn
         Y3zQ==
X-Forwarded-Encrypted: i=1; AKwUvByY+zBddjmQClEUWM9OTX1cnkScd28hokanoA5YZ+uCRSUyx6kz/kvb7ftomKYh1EiFm2IQd3Bqmlo2FA==@vger.kernel.org
X-Gm-Message-State: AFuF++netx0iNPtMMBiAX1vIPPnGdINxNbFKA2t3KJAZrQmc7PrNfLEl
	TwegvG47XwebmwV91fjB13iyKHQJkNlUpK2ukJpVlqZd+bAO0T109AiFjHPKAjretRa94Tray3I
	Xr5L45kmaAujKEO9jdLbXREJ5vrzpg41wxZKfJYTyjAYPBckcEnkSBl6YJvjAA6rauY0TRaeqsw
	lmhGDSusGcPhZkA2xqPUEq/4IqTHdxgCT9Rr0r022pB3lBz+nExOArAWAVw5B1nsi2KL2b7Nm1D
	cy3SOdF6+zCHnio+KWnGWI=
X-Gm-Gg: AYBFou2E48JUVBNY/LRl3qk3SGiU1J408QEiC94RNPr0wFutCAKjhu6Tq4t00UYC7S4
	/LBhEEQvBl+kKIMFHw9082v3VJohfx4U+xB37u9Fq5NdgWsbVRXyygt7fQ/kWUBg5Szd8eTG9SP
	XtziHaHul63G7l4yRy0DFzluiVEc5sWAQ6pb+RZYbbH1nG4xt7rBDiqkpN4xcNIN7MTJ97vAIdv
	q12axnERVzFhs3g5iFpErPrXc6ZQ0vQ7bqeXbi2MdU6e/CWgl9jG8j0JPEftwArmmjTpDm62JUG
	kjU5ER2TmLne79Dk7xwNCW4AzY86z8Ef4ZQ4h8yvfzGp5iFYRPKWT0MAfZ3wfZF2kiLbRnjmUhu
	1HXx56Qmj0ZTWb2Fyd/s5me7QiJjfQM01NMyG46zaVcD2vTkTfnAeHZXHpJkZjhDhj/+WV6/5Ov
	4vWEFtXR7p1pHOI9fP5ZSTL/0/DNON3d5TNQBCzuRI
X-Received: by 2002:a05:6a20:d703:b0:3dd:a196:9079 with SMTP id adf61e73a8af0-3dda196a86dmr1334251637.67.1789765018076;
        Fri, 18 Sep 2026 13:56:58 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc72af3fa58sm176476a12.10.2026.09.18.13.56.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Sep 2026 13:56:58 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb835525b10so1243408a12.2
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 13:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789765016; x=1790369816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Is2lUlBqSGMkpOZkUx2pau6e4D6+5AaH4X9SJHq0Dc=;
        b=ZPTLOd8VBt3krpavX0TpqAApx88I+N8iYVNHCT/zhyS6wpS/33LMJDiXvffvUuQ5o6
         xloN4v/HdcvRZPeAwsRHgdrlJDf7Zew1toTVN0HKe9HZhyk0Q5qjq1WnNFu94kwjuJh9
         h+lTKSZT+FGyECXbUpkU5rEIwM96566HDyiwQ=
X-Forwarded-Encrypted: i=1; AKwUvBypv0MTOgSLgfIhB4g7TvEgzr0fR7HiHg6Ootd8CPrBB7k4+PA85XffcSetW9QLE49UJOnjx3KlBIuGBg==@vger.kernel.org
X-Received: by 2002:a17:90a:da8d:b0:39e:6a81:5a92 with SMTP id 98e67ed59e1d1-39e6a815df2mr1513929a91.38.1789765016264;
        Fri, 18 Sep 2026 13:56:56 -0700 (PDT)
X-Received: by 2002:a17:90a:da8d:b0:39e:6a81:5a92 with SMTP id 98e67ed59e1d1-39e6a815df2mr1513914a91.38.1789765015849;
        Fri, 18 Sep 2026 13:56:55 -0700 (PDT)
Received: from [10.211.247.235] ([216.221.25.44])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d54b248dsm1235932c88.1.2026.09.18.13.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 13:56:55 -0700 (PDT)
Message-ID: <ac19e380-e93d-470d-841c-7bd3f2b0b86a@broadcom.com>
Date: Fri, 18 Sep 2026 13:56:59 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vmwgfx: Fix GEM_CLOSE returning -EINVAL for
 PRIME-imported surfaces
To: Claire DuSoleil <claire.m.dusoleil@gmail.com>,
 Zack Rusin <zack.rusin@broadcom.com>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260917181312.12473-1-claire.m.dusoleil@gmail.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <20260917181312.12473-1-claire.m.dusoleil@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Hi,
This looks llm generated, can you disclose the llm that you have used?

As for the patch itself, it is too overly verbose for human review.
Could you just describe the issue you were facing and what is the fix you have done?
Describing the current behaviour and the overly narrative style is not necessary.

-- 
Maaz Mombasawala <maaz.mombasawala@broadcom.com>
