Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069053;
	b=swduAAW18YwY7U79rpHthg5nW1iZRPQJmWk5tlb0rmW2Mwl0VpincWPttzMNCXgUsBQw
	 E8OSUqRd8H+4kyOL+4SeD9E8BvXDjSmJfKKQqg5v5r8MVQ4t/DsVZCBxU5p3w7BQX7IeE
	 39DyXM67paOUx4G20EsGnKNepAnHmfmxat93t0r86FSq2npGud0GIiCuVOzz0Rgx/YmoQ
	 5+dxh7nilDK5mdnb5jWxXXzFxTwA/ceEPf4Z7x23Aa887LhiWBXZOhjMzacVrU7EPhokq
	 sbM3n23BUV38dWZMlOK2H3o4QcYDSQKMSMMngQ0SUijpWFK1j13yjlDDD7Z4HN6vjlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=N/k+IDv8sIi75JOW8Ht1HpeWXINGXQx4B+WYQOoxHKU=;
	b=5aOF9mK3LPKfUTSRqZnKFayoDWFbQMbBfeZuznb6Afe2RKjbXnLE1/UH5VyeWr5w2urT
	 9xONegbrsGupkPF5YAWTIatVvClE5U38DQUXbGiLO0y2wBA9uuWMyGeERYbbOF2g+2+P6
	 RMOi2ZoyZI3imvijXoae6YP8o2DM2GbFBaJqG0s7KLsUedRsKYIZcx4mT1VFjNwtw36HS
	 hAFltBxgeKopMJVDjg6onGeQnGM4tQosAepj4oGkar8uCLDb/pUp1QC7Qf2GiVv/bLxDb
	 +FzXfUv1qcyEo+FFf5RuJGagh7C2ldOsSoaEHZhZMy1kopHt5KZ4wilBCNPclbodG9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QZJS7Ii6;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A5E606A31E
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 02:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03A5E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QZJS7Ii6
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35e8253292cso322557eec.3
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 19:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793069052; x=1793673852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N/k+IDv8sIi75JOW8Ht1HpeWXINGXQx4B+WYQOoxHKU=;
        b=QZJS7Ii6zu5XVWgGNt/1sC3PsicC3FVdAj4Ef5bJc0Dd2kRneEaKIDKRyVyMgMenm3
         p3RFIYJMOAm1axva+FpXqcBprc/MYnL/dkFciBObe7aIOOZrJZqKFSLIoynm2ghwJoMj
         N7sqzRMytnXpUH0hGIQSqp4kqKJhZqTVn4/qeWMb4l2XhaJfhxj5hoFatiYWIjslxxWg
         N1010rstYsfcJYOoqBa3QvWfgd3NXbZMb9V7pnx9G6MWAH1hhOne64xP0wF44seVYApp
         fPoIw1jeWCY1Xeaank0iyJ/Ynb+BqIzU5eKgH4F5Q/hxSNvG/4UXzyQfm+CXE8eX6+t/
         +biw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793069052; x=1793673852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N/k+IDv8sIi75JOW8Ht1HpeWXINGXQx4B+WYQOoxHKU=;
        b=r8SsFek7Wu01XQWbDFQcjuJNdqZr+5iHZTjSApaGwEteItNS9EzWddmnEVX8DhCoOK
         FDIXGmCtKrMtg6mT6OVFALljYYvFs/xKpbDzwLsj5405UF0clHJ6h7nEl38bMija9uaw
         rrbtQtcxWljq0hCxrTVLcE3Wo5r66sIAfw18ddQUUI0ZEK0NDSX/6BBGO9jGl4jyXDMg
         TaaxNB5ekFtZlUVDv+zc/ILp48fZ2lYpfh8vT7gpMEGtwjHEWANFy8VjqpwxXsBRaKRo
         9i7B1eONMUshYsruV1OWf/P+UW22gD/L5bnBbZVqZ/FzmhyeLLTFPnrG7fIVlEj8osLA
         pFuA==
X-Gm-Message-State: AFq9FYLsR0bjiisvO5FrMHX8YtAw/AdNPEAxU/9dvmxWuE7cz7cirdt4
	EiJAsEbE5vuJgSrZUWprJGwBKbNYFs6CaIB1tc0FTO1nemEvk+wQYkAefphyZWgqBxzyEw==
X-Gm-Gg: AYBFou1tc6eL5dZIyuqo4tWJhBh4owYYFWAC+7N1kKHwS79teVgXioSTSGZvv87g63S
	zevR71HuVqnkUejn+AHpdCkzIO4T8h92ZZMgvVhNAoy4X43Ur4yT+XMs+WjpUif8xxeHnyHrMyD
	dY3kNRWp7PDPdg323rCW3bEBVr2vQkGthWgBt4jOoTmDfMsnXxN+vTbetRT2SYA+c22x9XoxNVM
	19gnUZDeNOWdvA5QSvUa4rskxDor7ES0FFkGTN4rB3mJD9Tz37/3aib51vFJvC6hpehm7X2/UdU
	1OefZY2b2BCJRWUqfmhlmY1zKDgafmN79UjbkGlnFW+AoOJfdzBAv4ZhwO+8MrhCeKsDuUiQOcW
	VdtipYL7INn7R/mQRO7W6dHmAtXwGWHtS1fEnj6yjJSm9DUT3RRkxif/pAAbuj3JEZOMlyQlK6P
	D18bgV9Q5RhHJaAILztKGmPOimQ3z7sVoT4tysZxwjHW4PVnQKHtaPu+etB13+orj92YZ1L7HmP
	LeZKUeQtd5CaxXz2QDkv8Ksi6s7ehrWPbpM/JCWM82lug/RaFWFFeJY+GOhsIIPlnFM/u2ClFqw
	kNFskx390mm3DOKq6fYoZ6PNxDDLfKf/zJ7Z3sZsWN5M62oK23rDvOnzarFGjtl8u5Qg7hPwJ8K
	MpHhJoRZVG4CyUkaPF52FRhDOsr7zAGj0S0WqhdgkgQU6eyg=
X-Received: by 2002:a05:701b:4308:b0:144:fd17:3b21 with SMTP id a92af1059eb24-1991bbd19eamr19551190c88.0.1793069052008;
        Mon, 26 Oct 2026 19:44:12 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ea25sm27596670c88.5.2026.10.26.19.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:44:11 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] media: i2c: ov7251: Add strobe output enable control
Date: Tue, 27 Oct 2026 11:44:08 +0900
Message-ID: <20261027024408.354057-1-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <at9uROkXwXmNzFyh@ashevche-desk.local>
References: <20261026111032.88355-7-antoine.pichot@gmail.com> <at9uROkXwXmNzFyh@ashevche-desk.local>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andy,

Thanks Andy for your comments. The first two are fixed in v2; I'll
take care of the CCI accessors in a follow-up once this is in. I'll
send v2 in a few days to give everyone time to comment.

Cheers,
Antoine
