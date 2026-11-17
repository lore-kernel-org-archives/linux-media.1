Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794937825;
	b=P2dkuj/q4Z7TL9E2le/Ze7iUvmnfk4sz7o/4ziQK2hhmVlKRo7ZrsxUwJYe6JvhxVRue
	 BG9Jt08fPuY9x8DRjDF9Y9QWJZtljxOWzFsAiXgHYJCxGyV5JR/BE/8yfdQv1ZBJsvgsC
	 9Cxur7KUaMz8pExpPXH5WZIs9iic3KO/zAbPj1ox0iaZo8uzZcZD3zeR3dvR0lbRUNyu3
	 hdy7sARE3ESu4Uq2igradcoM2LI8eHPb82g3eiUXneFj/p3It4Zu1hy1NHO1+ykdpsDou
	 wDYB96f7v2TgWXGXR5IgvbKRSpFoDl4mXbwYzGCTVNknID3faSXrZPKXS417PSTBwMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=0z/Im30AFHM2eAi9Tnr3FY66+g/q3NA8hwNcbiYP2mc=;
	b=f6DGfxSHS9uYgxxsVmw+Yhjv7qM1+fObnDZs/GZk5BbK5ZlR3onV3he4nANmIMUIisBE
	 1jAGk11UiCk4g7j/hEV8eJGjPJSwUsQjN5k66GNSzUVP8Cn5/x5ZB5Q7ED/qbyoQqgzR9
	 ZmHE2iW3KTpKTftHaJC8sXQout5Im07aBJZdwIiVSzREvIFtOafxHs31xKSMyn+D/4lSg
	 h4nnlhdNOvKFdtJK7w04Sh1bJspqxZ3jHr6P+eCyJjm1xpa38BRwUiqHvGlLeeP+rtPt2
	 +y47L9tSske14SAgnoZBRlQ00pD7BKErdssfRm/n5k6yenJOhyJcdqiPNJAvwwhPVpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XyvFBtYw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ADE606A32C
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 17:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5ADE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XyvFBtYw
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b4d5e645d1so20716717b3.1
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 09:50:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794937824; cv=none;
        d=google.com; s=arc-20260327;
        b=Rw7yXQnLZkmFAdQJTdZ2tNBs3TN9Thgo1at6outptUoLAdIv1XtDdbpGDaWcxdZxiJ
         dWfBgqwEXrvbsbGbL2umyJ7UB6fXd2aJqKcabhVrTDoqCwfx/6ZoMUR3K9FAK3cZjH4H
         BWPGTgmfx5nRXX4wy3iRYLsM7rLkzLG2Wrv2oyK5wpZn4HhD+VpRagplSYhk2Ih8b+XE
         waUIDF0BEljA9Hr73mZSQBMMsaKUG4ELCS49WwsqScnaupvyQXADvXPmFsV0p+nG54/q
         b8EKx+YZAeeqjqq+OtTk04/SvnVdizK8+lx87JhqxU+5esvHW/JPfHVx/JCdoa5qVcmg
         JX7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0z/Im30AFHM2eAi9Tnr3FY66+g/q3NA8hwNcbiYP2mc=;
        fh=AdSxhQd4YrUD8lu/m6xfePbAUPnl1SOnrpTpYNKLO2M=;
        b=CbptIJLRV4Na+MWCvbetJkpHD9uHI04oWkjNETHyF/rT4X9cBKJt3zRhqWs4RZfvqd
         qq3LjtYiRPixBlcdPQXF+boK95WOT+KD7eB21rY873E3mvnP21TbCXha76dg55x/l/IQ
         Ko6k4lfguCP2G1B7D/2tmReXicIVM1vnZKUxMZPZ0Pw1bNsAwf+dqD1hMa0+yvNGXi1e
         10lAW91HdGg7VNE8nkTFByt3gt0b+Cxj7EApupn1qZ5rWoDgpC8XIIAfdWbsfPrpnaX8
         8uD7Klc+xOz5q6gMROU4fU9aMz+ysJJbDVw4OKvVWrGrm36VSi2rrtVPIfvisOKq+uDm
         98rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937824; x=1795542624; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0z/Im30AFHM2eAi9Tnr3FY66+g/q3NA8hwNcbiYP2mc=;
        b=XyvFBtYwfwl70PFylqvsEnpy5PTrdD+sPB6f1H6T2mnCXjT4L6Zy654U/PNxg3T0Jb
         2aIfIjtp/nfS3DrA7hDB6I4Kw02Iu4EzLhiT/JkWHq8T6XrLaJPOtUN9hIWFsRgOlr5n
         WlOQKBYBl8JYttiMmvYRpTj3NwYv2Oh23gPD5W0iAKV9hdSlofdGuFVJIDQ6cM88Mxqc
         oWfytNvze7QJkyoJ7mSwoli5wu8xKlBm0YbSD2kM2n8kiGzOIZXNtdqCwNFRv/5aqQTU
         bseO0k3gWygiYwZt0KWKosh/tqXj401ZlJnAjPCUQUdVg6zRiiQMNqnK8tmoHEfiswTd
         9Usw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937824; x=1795542624;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0z/Im30AFHM2eAi9Tnr3FY66+g/q3NA8hwNcbiYP2mc=;
        b=MopeppusiEyma/srVL5oZLSBKhjkdz89mSJyFe9BnisRzr9EBTsadT05a7zvqo5ws0
         Wl/rfXCirVwi2OBwBMuhskKTt/mkTxJcLNFXX9niYhWzIdvRqeM7WhB+zAhVIVKDNMG4
         hjcV9B9e/kaXmgfl+OEgHsiG4ni8RloacNtfnKfcPy0klCPs8o4b9HLDlpAMcbfEvEAq
         xaEemHZcf7W3h24BJ31pD4OpHppCZKRQFCsyt8GpRwHn6ItOCJYWe+xX7dHlsJ0sPzCm
         U44AReTcNjAXd+aMeOcPw1ZrlVj3JYq6/HAMiaIY8vaOU/p5rmr1MdQGUBu7bh8wjCku
         efeA==
X-Forwarded-Encrypted: i=1; AL+hErFvKqK8sndDwRQW2jnFTf4UZb4GBY5m5QRt6h9OufU40R9T8G27dg5JS5kursVb7zKxrmiVI6bpq6autw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/3bfP1a4njqDO0RnyGLYmxLC4/dgqFLV1MwB/0h2sNwEu9iDq9
	G2fy3ZFdgehg6iKwEkXOJnaC2XhCJn0ByhZbPGexXH6flrJbl460J8kQJ7hsQqVEpcUjqNPHS+u
	bFoLp2OqRRWEmQ4obf1uzM1FI5VwJUAw=
X-Gm-Gg: AZFdTZeo9/VNoW8KL2nt506PfoPSdu2+YT6IWRNbVjnAcSmexKFlNrn2Glb+04kVONL
	E7V8kt1BFifRA17tLh2kqC9HuYXp5dtQ0/yCrA5eNjkOcf7wU7O5+JSbEYDy28FdOwvCNHSYxU5
	aFu8PH0dTC5J9OLSe4+x2wV2JWdKVy274E5GmQHHDRwYNgkoroGVCyvGdhPkeAwpoHaw6GGjPIX
	1iD5sWBUVITb74bQ5RbDm+ogdq65eDIArXp4JBDV1djbjyLzWj4DQevnBklc6vR+qC3HOlPTB0x
	iug62CNrkl7VpvINwtfGb4+Xf6vNTiPn/Du0/hHakXAIy4fkqT1BT4aA6/qi6k7eNte5EAVlWzU
	DAWtb9qfHwZR+PK1deql4+31kMHdjCDji9vsbM8c0zXdj4mQafrn81GnFbyDwczb91KVJie4=
X-Received: by 2002:a05:690e:4196:b0:67d:ae02:4603 with SMTP id
 956f58d0204a3-67dd3fc2a51mr113492d50.90.1794937823656; Tue, 17 Nov 2026
 09:50:23 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116175151.20150-1-volodymyrchapman@gmail.com>
 <20261116175151.20150-3-volodymyrchapman@gmail.com> <avwk93N8D7AYGzDX@ashevche-desk.local>
In-Reply-To: <avwk93N8D7AYGzDX@ashevche-desk.local>
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
Date: Tue, 17 Nov 2026 17:50:12 +0000
X-Gm-Features: Aa3M54rRQ1-bLYzTuwIPPkNUo0RYfScU4jd-nC1VUspHbX57A9OiM6Umcza7INE
Message-ID: <CAN1s30pEE5vN7Yuz9Y5_+4M6-TeTNTmHA_hYLR9KLnXj05RWfQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: ipu-bridge: Add Sony IMX175 (INTCF1A)
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, 
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

Thanks for the review.

> Enough to mention this in the cover letter message.

> This paragraph needs to be once in a cover letter, no need to have it in the
> individual commit messages.

OK, in V2 the testing details and the AI assistance note will be in the
cover letter only.

> Since the ACPI HID here is broken (it's actually a PNP ID), can you also
> provide (as a comment) the excerpt from DSDT to show that device description?

Of course. From the ThinkPad 10 (20C3, BIOS GWET50WW 1.50) DSDT:

Device (CAM1)
{
Name (_ADR, Zero)
Name (_HID, "INTCF1A")
Name (_CID, "INTCF1A")
Name (_SUB, "221B17AA")
Name (_DDN, "Sony IMX175")
Name (_UID, One)
...

I will add that as a comment above the INTCF1A entry. Should the same
comment go to the INTCF1A entry in atomisp_csi2_bridge.c (patch 3/3)?

Thanks,
Volodymyr
