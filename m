Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019810;
	b=JtWqmmQiFjsrhOkksN2vrI+1be1dCQaoNvYO0F5+Ojc10RGZrwer98MRIUFvCvgjASZj
	 sdbEL9ZfYMFsh15DtxUz1BJIF6rlk8HmHJq3oZ8etFoJ/tzR90HAsSf7fflfMHGM8bxxO
	 TbhhmUVrAtMRAhvn1MGHzDLy37oa+dKj/wMGMyB/tO09tG6Rv7m+5d55d3Bf9FwqwLyIi
	 YCriaf63MEb+ncLgmf9c/Dgj8kBHuJ8likLQBFn6gOp3qDuROnFiBcoaRZqumVA2dJGbD
	 55QlTumPPzl8Q+r3P9o7zBvXaI7YWjxpVs4dLd7Gl22JAMsl7rOaMQWNfSCkBumPpRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019810;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tKOpF8s0K8IS1ZbqOxkHXW6afIjYYPCF6E/pUmuKDwY=;
	b=4ed3KN5vYMA+o9rnI6cbeMj+6v+VkUCzEyN4VKhXwbx2Ylpl8MLArzQq9vicIB2M5EYm
	 icAonEw62NxXnWH+xU8chYuBFor+NKEUo5IqOuyM/EZWX3qSYnIBGKeNEuT9aMpu04TIM
	 esYxX0STf+55UUq269f9H+X0/O9tC1y6Zk29QM1K1RFc1HPvD0pTQXCMSEI4Mrey9O179
	 ApgdYbkKY99byr3laic1qL+1TdTrFF+eQHcQyvoYN2aAXdgvLI30iy1zN3CsuS6cjNYON
	 cBNNtd+aif9TXGFgRiFR1jr9gXty5LwZ9V6x4E+RtJ3U58fBMo5dfVmTCsRxCLJKBXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LdvYwJhB;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DDE606A31E
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05DDE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LdvYwJhB
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bb5afa736so462673eec.1
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793019809; x=1793624609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKOpF8s0K8IS1ZbqOxkHXW6afIjYYPCF6E/pUmuKDwY=;
        b=LdvYwJhBKetf3SJOJnvMSPPjGCYJB6FhZBIY5xnvb2pc9v22Zxeq9j/ATkFMl6btqo
         fZpPdyn6kh+IEdxjgouSMfbHIQDJu7uQC/iooGs8rL5R42UOPSr6p+bdmf1jI24t6HAv
         MB4Jbk1Ph7sb+kzaaq+OVV/udsQcSA8iixCOyZAvgH1N6DHizvQFOnu9pcqgsR2y1uga
         UmuvQ2Do7/MRU411bJulNcFjXMv5SfL/gcxbt3o0xVdipIkmCppikXFf5CXiqcSIJBLI
         hY1xmsw2+COAFyc2UPrEaZyj5qMusvWiziCyfJZ5tn4AZv92oCMafAKRkSCJDcOk1WjU
         Jn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019809; x=1793624609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tKOpF8s0K8IS1ZbqOxkHXW6afIjYYPCF6E/pUmuKDwY=;
        b=bwwHFU0CIAM1lWRzaO0ynmUlO6NieYihGHXZMY+4wPRtPts9pyq0L53LlWLvS3JTVW
         sBYfhEdMBaKDl4WjgH0WpvbqPVySKs37YQwK3GdD6V4aQD4H/CLcxLzREN4Fd5fyzeBW
         inMwMPhn4JJgR5iOY0LAIv0JYoT2aEDnT7iweNtwvVh+jcaGO8f0c25Sv2gdSmxoJyLS
         lJ4F0QwNyH23/ehb/QywZ0XI9m/DDjckOF0c5i5emnV5Pj3s2TDe+UwrNlFQMO99cBmk
         qTi0tGe3Cm7L485fRe5znlzuwtyZRhqRFpYOYYsgzpLYaPkUDjcBI1Nde53QNTjWu4/Q
         WKCQ==
X-Gm-Message-State: AFq9FYIaBQ8RCJkPoXFOxAJmxXWwazvQ6UzzVgvKUKJP7zq8OacYX5bV
	G15D5OaghX3iV5F3H6aT+4CYCfxE03na597lA0o57XgYkCXS2cOpCAmv
X-Gm-Gg: AYBFou06YBw9vnYT0RfaYAI3mMrCm1r5vKNkTJsDAaqntWeDUz34ShSNJVBkOOzOF3F
	aOII4qttuEQUffbFRA5Uy7zy1YAlg4Thi4IUdbguZU2+yXUpXe3bhi7OeqTgJN6eND0uFBBymPe
	ky8SoROGF0HEg21wGC5UK/ywJdZCFCFsaFyOuB62Lz4lPhalELrR0nQOfY8GMr3FK6r4hsM+/IM
	lZyMH5TmNyCEv0jbt1t7rVT918XSl/Oc5g39pLzdhYnYm2IFAQywozwqJxOSULfSUHOUJQJTqi9
	P8ZZ6l2855RPGbmeOYko8yDVLB57qGW2JG3vHQsfXVJ652cnp6tNc37lvxFBiBcugBLH1m66ZRr
	ZdM1N77I3tQ96F8Rv7+RCdVTskgPtKwJduUiCgxmQxBrSMCt16vsrqsoQNYdVQi49lfHDu7q0jd
	WU6jnUG8PUW33Ww4KxyM6HJzqUsW5M19dbrrwgGLNBzDibSK61DoO4RmvGEwwpwVNgXItBdneGj
	vzZVvCpthKVhLlgFi/zn6ocS3iWxZEQeV43Uzku915Ygb2Ri094Lx8mt/AzkYORMOVTZSV8kOWL
	omyxcrDzx42oxqBXOVHQ7k4r0T9VMJ6o7zjxFx5FGwb+KLBdBXf9IAG81CMZCF+Qg8QotYKX6DG
	CVGkSKjQcy4os/SX3Y2e4xOsgL4RWtAycJ5Fsj+mA/ice8w==
X-Received: by 2002:a05:693c:8646:20b0:368:5521:612f with SMTP id 5a478bee46e88-369e81cebffmr19279166eec.0.1793019808835;
        Mon, 26 Oct 2026 06:03:28 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm47634012eec.23.2026.10.26.06.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:03:27 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] media: i2c: ov7251: Add control event support
Date: Mon, 26 Oct 2026 22:03:23 +0900
Message-ID: <20261026130323.169560-1-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <at863XdUDea7JDA8@kekkonen.localdomain>
References: <20261026111032.88355-4-antoine.pichot@gmail.com> <at863XdUDea7JDA8@kekkonen.localdomain>
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

Hi Sakari,

On Mon, Oct 26, 2026 at 01:34:53PM +0200, Sakari Ailus wrote:
> Instead of adding explicit support for events, could you instead make the
> driver to use sub-device state? See commit
> e8a5b1df000e1a23c04dadbe99621441e0889f88 for an example.

Sure. In v2, patch 3 converts the driver to the sub-device active state,
following ov5645 and the imx219 commit you pointed to. I'll wait a few
days for other comments before sending v2.

Thanks,
Antoine
