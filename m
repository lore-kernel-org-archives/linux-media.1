Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107606;
	b=GmSo0DvBH/HEIhhNrygcwzPE9vsqEomqUwyRfiRBItZwFDeAWzdhSwX1qc+7hO3n89F2
	 odIws0qCcUdJ0iMdJXFaY6FH6gxIYUXU//1KlsbyST0ZVBV94bFA67GyQQCKL8rEJt/2/
	 SElBvXENXtw6YJO1Y3DHAHAIDk13vvmizBxUnAkrJB5HDoANNNIB0NWz+aETu5XxMEgvc
	 UDZqZBsRETISAdaGO7S/HaUh9moaPx4yYbHEa5GTtGFbvAZA79HNs7omdJuRUGarR0RZN
	 yW7aOHpwQAOIJSaHvYOMunoLaZIEKwyOMtlcWJodc91iqYDpdI6gz/FNEQR0tRS7vrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UrOpUypNxtaw7z9tGQB7pFWtoYjkYD4SVEoMwlkiYcQ=;
	b=Ykp3CzNEGVidoLW3wEBCbHHViQJtLZoA12TlzVyx1XEFfhtC8Vqvaht4isvYIahCt35q
	 CBFObMVgsSzqRxKPGe/cqfdkDOkf/ZIY/zwY+Idw2XdLXLzrgGsjjYkih7tJzcPybWY8l
	 huEJXAMAufU5jYfYc6lLzmL8wcGLsa5VzE9fd8NjD95yugJPHkkKSCXHwyB2Ogv+yeQUN
	 yvz1Re6hldxQT1nxRiOzh2vfp2jn2ePFQBemjqhvj0Sj/xkDOw/TQto7UXcMuMwZHBva9
	 dxmbwyvC+W9FArUyGbOWA3snq0kTnxxrwPmtcsR6mz8zJAh4Xv5XQIcY9l3XOybofJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YxGGQope;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59816606A31F
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 13:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59816606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YxGGQope
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-34c522572bfso536673eec.3
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 06:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793107605; x=1793712405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UrOpUypNxtaw7z9tGQB7pFWtoYjkYD4SVEoMwlkiYcQ=;
        b=YxGGQope3XmIOEeVNsI496jKnBqjPaygkcrOvLN9Gqhp5LWOQQENnmApcZMEfWG2Uc
         RD4meG/tdn9e+IKPZ/jqmx4kBLGjLrpuhgFZ/tvwo3OP8EBnU6+EdErQCS/J5In4ZP/B
         knqGhBRgRSiLn5zIBa9Wx2sIjAh5g3eizE/U2FOQEmDNdwsrlXZDaDsWSriBDI9Dcdjx
         VcakTfZkyoNYPuq+R1QlfrY01iBmJ7wS/LvBT7Ga6GSKcjXisFPUa3DOoL3nF6dooDQ8
         Whgp+/yWcTbeE7sfrFXlI3hEKUrA1oJIzppsXDggB/ND2XzWlZyiQCAcbV0APCAU7mgH
         L35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793107605; x=1793712405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UrOpUypNxtaw7z9tGQB7pFWtoYjkYD4SVEoMwlkiYcQ=;
        b=C5bHbkChKOei3uJE8XhOpD97hbNtUF93jveP2EyJFl2h65lIZljiCkXIPz9uXAgj8a
         DAoreaHJnlnUCK4C2Js8F+kO5KAPs+0UHbYuTBh2iceajsi4ZPjrYUIvrWTRF0kkteso
         qFIKQlUSswHR4uP8ZTUgGmj1HwepNIQ9c4ze2ZDa7e0viUKaWiZOLMXd1Mm5bcKyNiNQ
         r/aDPAAbmcFJshZcCN+4WjhbN3gfPwtP2zWilhp+SgPcMoPe901catWV14KzjhvPN+x2
         URsY3I//0ve2SEIEZ+G73Hn4mS1VOQeVQufxHwHbGHBBfGTfATZfduwlHJp8WQt/X+zt
         dkOA==
X-Gm-Message-State: AFq9FYKaIk5+Qa3ZANCdDZqLSHT5XxHP29xQp2yidPG4AcyELnl/gagn
	ZrFK4NeJEaT1NZb5l1FfaCy2dAN/VTpIbcMBWbypX68wKsFQQT/d0Ebh
X-Gm-Gg: AYBFou1jgE3cORWf3Hko8YJfbklfbEmOB8hH5xgto5N5idyPFR2HKh1UgMWI4MghkMD
	15dby6rWAtXhmC6ErBQDTFOlDxZe+n6AmLLf7fmefSz50rzjYYMvkUlyU04CNFfIgfiNp6Vnn8K
	Ew+bxPEQyGL39vszD28M7gUGmD4uoiD4Qlfd4v11sP7+QsSIBsq4HDHpS0l/nSs4zjSWDuwgKN6
	VqgPKYnXDYgFyM3uobbpNEOitkCoPFP4Bq7IQ/6oUQu3aWzK9QbC/j2T7SJu9A5e7kRGxcI8/xq
	DOCKydI9Q2MTqhhXCoj1EU/dfEum7GVYpI+ZSrGeeRlPKti52MKxslkOp2RNNeb0dBXKqjWSDpe
	7dgb9h+yLwHwCtE+MGWsPWDxNCOOvHoosv0cA8OQSVn4daK3OHDxhwZNspRTOEGu8EstTJSC9ua
	IVqQAUbqOK/djxx+fC5iguL4KqsTag3cgvYNdKDmBwzGErgpUwKqatUQZTrL3hpEroN2tIqJXbC
	ZugDzKC+g7IPeB4T1mqnwz3s53NBu2i+uFWNvJMNw8mQ2H6usy5bWvIZPmhAkyozpMLIk7rwzzM
	eryeZwQZ+GQWzDXIX1IQfb78dIIwCY6D/NiWVTznAsEk0431zO7NwYbnrzzwWINaWAh9Lqf28wB
	K7rPHQoNX1XRDt8R0v3TWMGWDsutVlO2ob4HaSLkMFsf7uA==
X-Received: by 2002:a05:693c:8646:20b0:368:5521:612f with SMTP id 5a478bee46e88-369e81cebffmr26854868eec.0.1793107605360;
        Tue, 27 Oct 2026 06:26:45 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a064510b0sm18478013eec.2.2026.10.27.06.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:26:44 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: dmanresa@gmail.com
Cc: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] media: i2c: ov7251: fixes and infrared strobe for Surface Book 2
Date: Tue, 27 Oct 2026 22:26:41 +0900
Message-ID: <20261027132641.540323-1-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <6ae07c62.e52dcaf0.293af3.e647@mx.google.com>
References: <20261026111032.88355-1-antoine.pichot@gmail.com> <6ae07c62.e52dcaf0.293af3.e647@mx.google.com>
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

Hi,

On Tue, Oct 27, 2026 at 03:26:42AM -0700, D. Manresa wrote:
> Tested-by: D. Manresa <dmanresa@gmail.com> # Surface Pro 7+, IPU6 (8086:9a19); patches 2-6 only

Thank you for the thorough test. v2 carries the tag on 2, 4 and 5.
Patch 6 changed after Andy's review (the span computation rewritten,
same result), so I will carry it there too unless you object. Patch 3
is replaced by a conversion to the sub-device active state, as Sakari
asked.

> That CID is not added by this series -- it comes from 5be4154f6255
> ("media: v4l: ctrls: add a control for enabling strobe output"), which
> landed after v6.19. Since 6/7 uses v4l2_ctrl_new_std() it needs the
> v4l2-ctrls-defs.c entries too, not just the uapi define, or the control is
> never created. Worth a word in the cover letter for anyone testing on a
> stable tree.

The v2 cover letter will say so: 6/7 needs the strobe control from
kernel 7.0 and is not for stable.

> 4/7: camera_orientation reads Front and camera_sensor_rotation 0, both
> read-only, consistent with the _PLD here.

On the Book 2 the firmware reports 0 but the picture comes out turned by
90 degrees, which 7/7 corrects for that model. Could you please check
whether the frames are upright on the Pro 7+ and, if not, tell me which
way they turn? 7/7 can then carry the Pro 7+ as well.

The link question continues on the 1/7 thread.

Thanks,
Antoine
