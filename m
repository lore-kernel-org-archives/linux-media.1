Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292978;
	b=Tn+B/mtlc1hu5d89N72ugtqp8dzcmgSUs1WEXUSyjBKxr++Gf1qD19LmgQCV+HZzUHOO
	 T8LugYz/m/H69snEeOKkupTfiUbB2i2KLOjR4cQzyi7EIaOz40U8GPe7KFCVgsryUPXDr
	 y/aGJH08mJz82doMOLsmpZC/U8Ip3SfNBMcakC9MVTA+mnbWoJbu9d4u8J0+nU23Ha3Ma
	 41boiIfpvMLEyVy9H5Vc0Z46707n/SVjP/ypzJHnn9LSMIPNeXxzLByyFApkCXq71lsJF
	 RhYcrNeb3ZC4LHQurm4lnNXB5XAD7TDOJVQAujnDmUDX4dolFCte2MI4EqNXcwC8mdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=kL5j3EEqbMn3qYBmWtzp3XXkY9AfG36sC38Zmkd8NNA=;
	b=0KcXnihQUYvsAz5JbwI6ZpRco9dgYGLniiWF0mv0efXW/nxALYvMaKDdveWqt72LdPrt
	 aS+QDbBRMVGqEAR2l/aaT3VcozYrzHpB46SkS6hvFxMmw6JaDSR6Xp4/OI2RzgPGg97f2
	 EAonMwqsgOeEVQK4ubO4v2BJDUCIibxfp8eTw3kMatSvSxvLX5ZeqDmt75GFiW2cctvOv
	 4KvLoJEiqlD+PKwAFCnJmvap9zahBIdwIBCT27WFZHnJwMyicK3uvMT92SL2ZXKpHxDhG
	 ogvicFmJziFCLmRzJQi77ebyiYQ4wCMkkfBEyuaoEUsUOZ9IjrEaXBJFr86gYUP2UdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=nilk.net;
	spf=none smtp.mailfrom=nilk.net;
	dkim=pass header.d=nilk.net header.i=@nilk.net header.a=rsa-sha256 header.s=nilk header.b=fHewcwhQ;
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D77606A31D
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 16:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6D77606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nilk.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nilk.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=nilk.net header.i=@nilk.net header.a=rsa-sha256 header.s=nilk header.b=fHewcwhQ
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4e4a4d77e5bso667524b6e.0
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 09:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nilk.net; s=nilk; t=1793292977; x=1793897777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kL5j3EEqbMn3qYBmWtzp3XXkY9AfG36sC38Zmkd8NNA=;
        b=fHewcwhQIjNO0M14v2tyKKNcwasiZIxpd0YZ6NF/ma/Eh29ffF64GuU5nLtuXnlDQc
         75PDEGdKkSZM+xRlXuJX8lxNAs+aOJUskHSWRdHzJ57hxZ1ksqbdPhqcXIemcRBEnsYD
         CHM+zuGGkz9hoSKp1i6IlU5pLHpT8pIfaPHMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793292977; x=1793897777;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kL5j3EEqbMn3qYBmWtzp3XXkY9AfG36sC38Zmkd8NNA=;
        b=EIoK/cUvefV3527AlCH13/tzu9jMMzKB16PT84zShQkLEeHBJeweAynZohK5UgsXgZ
         9GHZ7c6zyW/a6IhjpzwcbcB9URV9MWFLMOw4aj6oAmSkaHDrWeaNd9x2xo9mkP8AX6pk
         Ks6161KJhbwS76mkoC2/5T2rbAcDDHWwe5Fm5aTHEtllRoAkt4G/Rrf98wd+CWK8cMjy
         zfPl5q3UEolkZtMwdPyzPf9MzKwjEh2IvSY2oVOisuluTV3gUQ9Tusllluh+Ebagg2oi
         I+YgEymweidgqwL2wOJtIjX8fT1Hv6sZCDmQXfmMqW6eBMxI7tk0ugsPc+J3W8eXS8FH
         79JA==
X-Gm-Message-State: AFq9FYIUJvG9/Lf1Y15fOvqVx6Troh47UcRZov/lUC/KvsHKKsvgNAc4
	FLsnARzuo9EZccwywTlsvfh/nDO77pjpDTMvtXdkZ0qnNcVg2PTYvArByHYb2zNM+Q==
X-Gm-Gg: AYBFou37Pla3pr14p0B9uKqx9ogB1DBaTlgLT7o7SZrO+/n/sMhibQDpPV/T7EMp0Yw
	IXS2Qugio3Qrh0XJ5WvbvRYUEaumKePwtY7m0UHTsddV2cR1Tz3XoEuXEmdFC2HY0Ufi52BuNAw
	9w3N1iwi1N7miiufftcQT8mBbXaLeG7JviycTBlPnEj5y0Xk/mrH0/M8SoLg1iPzW7NTXQ57AeL
	3XdWKZv9dWQ+gV8ZrOAK11TzEyqyAq1/Kk7xRROsWOBIhpAgNgJukeZrnkf+/d8Nsatt0CjhXxI
	hBv4wOF9ZZAdXZzZN8RZ048wEKL3ytAKiMCry296qkyAXEPBqvqiAr0H+oybVvQaJ41Yu1Ty0Fo
	set4ra3JXTeeBYnZM6+CR6SBf+76agAdjhcmWpPzrD66qmmCPqELieE9sQh0uSjq7+pRBPN4Trn
	mLlN25lKZIJuHk+F2jzOUidZ7MApz+xXJbNLDW4jDnii5P6cRhDNlVy8QcExcmsjq2rJ9cZ6rVQ
	4wyKzWawM9mHWYbs3F+Sk2ApDSPgwzYstfdHnDg+wqjDSVAQ7KW1x5jpq5fw7e8qN3XQW94dkmq
	HIfA1BC3hrzrT1k327EzlynysPhI3FRB2u3z3bKYjVVM7l269Cl/1MROn84pagzBl3cyGcQpMEW
	szpmiiaRx6WzH4D6vJugdeNJ9Ou4jgVO7U4OGNNwtfl2Chjw+sEzI0RBymFpgiiIB9Zf6aGbJug
	zPwA4r3H55bzUqMzVxrHbDqcxepG0fBytXtBncX03iTKcPjShTaNcZtr1h4MIV4ofP3lFZ7s3cs
	9H0zerL
X-Received: by 2002:a05:6808:1b2b:b0:4b8:46e3:e224 with SMTP id 5614622812f47-563ef728ba8mr1823577b6e.16.1793292976579;
        Thu, 29 Oct 2026 09:56:16 -0700 (PDT)
Received: from [192.168.0.114] ([187.14.252.62])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c634709asm4289499b6e.12.2026.10.29.09.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 09:56:15 -0700 (PDT)
Message-ID: <1dd56310-9286-4321-ad1b-e4643aeaf60e@nilk.net>
Date: Thu, 29 Oct 2026 10:56:13 -0600
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
Subject: Re: [PATCH v2 1/3] media: i2c: ov5693: Program the mode registers on
 stream start
To: Marco Ziliani <rylos78@gmail.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Tony Garcia <tony@loafecho.com>,
 Simon Kruse <simon0x+git@proton.me>, "D. Manresa" <dmanresa@gmail.com>,
 linux-kernel@vger.kernel.org
References: <20261029-ov5693-fixes-v2-0-2526d7b13030@gmail.com>
 <20261029-ov5693-fixes-v2-1-2526d7b13030@gmail.com>
Content-Language: en-US
From: Chris Simpson <chris@nilk.net>
In-Reply-To: <20261029-ov5693-fixes-v2-1-2526d7b13030@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Tested on a Surface Pro 9 (Intel Alder Lake-U, i7-1255U; IPU6, front
OV5693) in a 7.3-based kernel, with the v2 series applied to an
ov5693.c that matches the base-commit (d7e7bca71698) apart from the
pad ops' client_info argument, against the same file unpatched, using
raw captures from the ISYS video node:

- With the sensor held powered between streams, OUTPUT_SIZE (read
  over I2C during and after each stream) matched the requested size
  in 32 of 32 streams requesting 2592x1944 or 1296x972, and every
  stream delivered image data. Unpatched, it stayed at 2592x1944 in
  all 32 and the 1296x972 streams gave no frames.
- With each stream started from runtime suspend, the path v2
  changed, OUTPUT_SIZE matched the requested size in 12 of 12
  streams (as it did unpatched), all with complete image data.

The test scripts, the analysis of their output and this summary were
prepared with an AI coding assistant (Claude); I ran the tests on my
Surface Pro 9.

Tested-by: Chris Simpson <chris@nilk.net>
