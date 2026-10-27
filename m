Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793135324;
	b=NVB+0lohINYzMzAh3IBtp7tMwKJ+01OgOsvo3Hs50hw4B4pGghqnx56sUP/pOYliYXtS
	 Yd+fXo7TXyQtJAK+ndJ961HDGSaDcydb+QGfAWHRTBLRmDCGcogkjxZkfKOoCs3Szis3z
	 4hN+G7qDmgk4wN7nMGrilHRWUDRU2l7O+GGfrjkNCKlUKHGUAFWdQhU9sucbxjdWN7tPu
	 gxiunavquR1zPtRisrYTeU0BxVnaaOWo4q06GpG6I07ET7Ys8cu1amDmaRahNiJtekZkN
	 Asp8Aik3HCovL/6o7k5JFazz+VlbW/eDO14rMDO7rhYyNAZXMgMM2nuRGIA0EFgl5hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793135324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=wBbCfwwWjZkUqDc8LVdfW0e57s/UTOwtgRob+ow3T68=;
	b=Oz4OxJCU8/bzt1SQyy6GcpjODVO2xMk70AmJGpcSNwaF5u/sa9/3P+8Oo+9MGAi/azsw
	 /e+vujkZ4Ofq7WIilj4Zf2A/XSd2IuLZvi7tq2/GG0+wkpSdeSixpVj7Qwv9CeWC1+YQg
	 L0TBd+vWnusJvsy+NZ59YbPA2ThYF8Gel+aCKUhKUiexeaZ4XsA7jL5Kdbu1CYWQHrTZi
	 LhEH77zgQ6CWdIPzuM3fVpUBJl1hC48wC3DbkZNDNOLw1PkH/WE3nnb0/iTnnfDyND7s0
	 zZt6Q3rfdr9w6EeV+XNAWCCO1tii6vrm60Wen1qxb4En6tS2SYFQlKcMgmOvvEeqAyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=nilk.net;
	spf=none smtp.mailfrom=nilk.net;
	dkim=pass header.d=nilk.net header.i=@nilk.net header.a=rsa-sha256 header.s=nilk header.b=Eg7+23UP;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A91B606A31D
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 21:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A91B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nilk.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nilk.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=nilk.net header.i=@nilk.net header.a=rsa-sha256 header.s=nilk header.b=Eg7+23UP
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-499f20c7054so193466fac.0
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 14:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nilk.net; s=nilk; t=1793135322; x=1793740122; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wBbCfwwWjZkUqDc8LVdfW0e57s/UTOwtgRob+ow3T68=;
        b=Eg7+23UP50mz1Qlv4ERIvfc7AXiy6cSmsmUGcfTJxfGQjKjyzdsj8D6fw3s4xmZDnI
         VP91qMb1ybsGj6pD9yNkNTp6cBc9/dVmfSHxwMAL7PpucHcjT+fOv1FCL6CDq7R7m4SH
         mFY4vqFg3cSfRLV8ET4CFNxDmM9jkUZiTOrzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793135322; x=1793740122;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wBbCfwwWjZkUqDc8LVdfW0e57s/UTOwtgRob+ow3T68=;
        b=PBMGH1p/vP0zW+3+hNVmjKYf1PMdhRd7xnG7vHGOm2D3N5+HgrB7uX43DBZfNOE189
         KjsLghxpsheKzbOWe53xO7oBQvxjTRRE2S80z/egkmxK2UXq798zqOIl9uOCyuoAj9iN
         uSzlIf43noYFFVd/PskpGpDEc2nT2tLXQlXqxTEWpMd2k8mEsbzv/n5AbgTe4P1jzuRR
         JpGhORPb3S+Zx21gcdr39q2aHFqrTFm0aU7FtCl4MCgVRfGNVPbdBS+wLDkgZry0hyy3
         Gy9jRmvImePHuwOMmVzIMe/o91XbOUo6IwvFBq29AhDqMk2T67oTcSiEStN01jCDazmp
         lG3A==
X-Gm-Message-State: AFq9FYKlijBPhNX/i4V0yHSZqYkrjfUBSnVc75c0DGnTQ35vA7hDcLps
	64SEEA148g/cUzJLvpJcxF8ZRIjFmaIbrwccYU1Z0XA91+li9s6wUDMokBW0JigUsg==
X-Gm-Gg: AYBFou2tOCWvB5vUuWs+c2+yNg3xoLTYFLaZBSYTYZ+3jpbeA0JzODd6a5uw7ac+PPO
	1VkBGsVxCtfalgcgRpkyLwtK1ndDCoVWYBm8gbpg6vqY8DXtBQpm14IebyStDKaLKGEyGreOA2x
	VXDfiuqXcxPFvApriQHRYShWszUQo+U3OmjD4uHJNt8AUgMq7bKOsB0ICSc2Iwh8ZbT6GGLDupw
	1Ey29EJtWGfffiF+cEPqb8JxLQLlvHll7lfMsal5pQshpT4Lw5jEmYCpOrQx7vtR1rflfdwlS90
	JSJgITcDd/5gR/6HNW1CUqKNclZNJmezrZIWpES0wIURCQL3gk8x5Vi7E6weclVIeMAkhm7asrr
	LrZyz7dHsUyrr5s+yvl9TDTDVKvRbSPtGosOLYI3hykBZ/27sYw1T7oRxT/1Kb+2xa1cYjHSzIo
	aMJ/uvUS8jbzD4HQQbDfhnH3Z3N+OCMihWa5tgyj6/hJv79hdnAtgY/K5Pe8JHBXTjnYaA+V4NY
	VbxAbxyNgJAo9fre4NXUVBFTWYrGzta8D2txvePOgB7s0DcR1xBemagC82dX4X+qflCVqxgGkiV
	KEm9uzJWKSp6tzuhAwu3SA4YXsF+cCW2hBpqSOYsXEOVi2DUfZa6xLbeJFgK+CoOnPcJq6IXZwj
	h0gjDFLEwsQalPsHA+h68W8fm9U3vcob9x1VMvoW2XWRmNyL74jK+07snyPWDSNhfhibJ5zvlGz
	W9+7IbDx3ulut8P8LRoxIoD1++RQkXaBsDDA==
X-Received: by 2002:a05:6870:1410:b0:49e:4ed0:11ca with SMTP id 586e51a60fabf-4a8bbd30979mr536120fac.53.1793135322487;
        Tue, 27 Oct 2026 14:08:42 -0700 (PDT)
Received: from [192.168.0.114] ([187.14.252.108])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b74c0a7fsm970446fac.2.2026.10.27.14.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 14:08:41 -0700 (PDT)
Message-ID: <111a2ccc-a1d3-4516-89d3-897823e05331@nilk.net>
Date: Tue, 27 Oct 2026 15:08:41 -0600
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] media: i2c: ov5693: Fix mode changes, flips and
 autosuspend
To: rylos78@gmail.com, Daniel Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Simon Kruse <simon0x+git@proton.me>,
 "D. Manresa" <dmanresa@gmail.com>, linux-kernel@vger.kernel.org
References: <20261027-ov5693-fixes-v1-0-3c8ab1ae104d@gmail.com>
Content-Language: en-US
From: Chris Simpson <chris@nilk.net>
In-Reply-To: <20261027-ov5693-fixes-v1-0-3c8ab1ae104d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Tested on a Surface Pro 9 (Intel Alder Lake-U, i7-1255U, IPU6, front
OV5693) in a 7.3-based kernel, with the series applied to an ov5693.c
that matches the base-commit (d7e7bca71698) apart from the pad ops'
client_info argument, against the same file unpatched, using raw
captures from the ISYS video node:

- Patch 1: with the sensor held powered between streams, OUTPUT_SIZE
  (read over I2C during each stream) matched the requested size in
  32 of 32 streams requesting 2592x1944 or 1296x972, and every
  stream delivered image data. Unpatched, it stayed at 2592x1944 in all
  32 and the binned streams gave no image.
- Patch 2: raw 2592x1944 frames are BGGR at all four hflip/vflip
  settings. Unpatched, the order is GBRG with exactly one flip on.
- Patch 3: with autosuspend_delay_ms at 3000, the sensor suspended
  3.4-3.7 s after stream stop (the delay plus the 25% timer slack),
  after both 1 s and 5 s streams. Unpatched, 1-2 ms after a 5 s stream.

The test scripts, the analysis of their output and this summary were
prepared with an AI coding assistant (Claude); I ran the tests on my
Surface Pro 9.

Tested-by: Chris Simpson <chris@nilk.net>
