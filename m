Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792519830;
	b=p+koh0vqk1UD7EDvr0jptvWAVx0P3Z+hhtk2GU+1cfHsrq5OV57uT6wtBrUxnLivoTEm
	 M9RPXQcKRXuL/8Nk5dl16RuS1fetwUCfop31UyD/6uEyE57cxny336a9IPKq4aykh2zFx
	 Jru/doJUtnoyugJxWyP2GMK1bNE3wIaDtzhOJsjP++9svmCdjTdzRFAKL7+b/2qbLpNWV
	 TeBG2lwciX89Njp0DTjaE9Qub81QYpFx5/q0SNk41SG5GNFlIBZ58gltCK+jkSthAl+4s
	 B7R09+z8uooq3mx2DUXPQTGkF6xerK4JitmpNxM/pluEI6YqR1C4mdvurQCa1gxkzZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/6BgZB1uMeWS0XRauHuUVvKezouU1iP9WGA2DOuIHe8=;
	b=ikzNDZfA1WpdSPd84YmdIBNbeiqj1KGhzGz0hGIVATui6blYdayCJpACWT/SLBdAxyKg
	 IrPE7xJKuew31L/W0YAllB3qLgG01L4ihOPF6RqNW0RChDzwZP5n6EoWg9V4MnFV25MT9
	 3cbLR5ndzr0LuWAh4tRHil4BkXMkVTvbvxJDrXLlkKm+Nl1UqYuFYPlnfEoMJArCMZIL0
	 idkAqhTUIEYQuhjRtLf6chN0H7WTycCv1WS2SnI6j423BMlFEbWC9nSq4iOMuYm0+aeZo
	 Z8vWVYGjiAbpNcMCCUIv4J1Qoinh3H0nsvDKk7dKOd88Thejumgu9NTKXGOW8VjPEOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ye6rukP0;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C856C606A31D
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 18:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C856C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ye6rukP0
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so29621285e9.0
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 11:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792519828; x=1793124628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/6BgZB1uMeWS0XRauHuUVvKezouU1iP9WGA2DOuIHe8=;
        b=Ye6rukP0icPBg5yA4loFUF/P25NgO1lCkbvI4IebI73fp1j+gNyAtUKvTozJG/W+Si
         vdSIQqvUMmPA/RQE/fe/+6Te+2pxSe1GCWLfrqIwpd4in0TRCRLwSuKgwVvzCqljxurg
         8JC+s+eqg1SBtTMPRlihaK3PILRNkd1zZYvfIcu5dOfVH+8EDM0fJ5dN6qu2/QSltfSP
         Zmnqg7KDp6Vr7EixGMdPRCzDZBMh9eOnLf8pZK/ZhWePzEbZBFKQpC/YiQcMcmcbqQt7
         26IEDWusl3rbJVu/+JOR6Y3rKwm4um4PuOlBZPhDEEK1aWuzLcYRtnpWyTpXnfDiRQiu
         lVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792519828; x=1793124628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/6BgZB1uMeWS0XRauHuUVvKezouU1iP9WGA2DOuIHe8=;
        b=uvTUuZj6m4wM1GXCziuprqyIMXV3TQWdYJHwbvZ8//IODX5wkVA/pOHzPLn3PbbOUp
         qyifyeZBJnbE64WPo222BIhEYSmEmTSVMiM72FGlR8+mNahmS2U90iH2ratjDo9Qvt+r
         M8JurWmrdQRbKOCX39yU02g1qmxZdSLJGvoDJkO2nsgRA6Azjw0l66sFLs96eaCCdzeV
         9QpAUZVYRAB6pjg5w8kx/lUt93HDkU4QxA7Q+HClsJXlO7n2Cgj93MUrVz8xFaArfTz7
         bRRyBTlaM0NwXaiOqbnWp0ogFR4MI8spfVki809Thp7gkHXWlRo/zV+dnrVODFVhq1bq
         8XYA==
X-Forwarded-Encrypted: i=1; AKwUvBw5SGqtmGFgXvN3GyIlURfvAS1sdEADhBeRs9k5wwxPUUqi7dtlZ1v7lvZUlbMqvxP+NtE4W780Luda5A==@vger.kernel.org
X-Gm-Message-State: AFq9FYIrD4BiEKTkSg6lgSh2H0xGAcW+J0v9XooDLyC01f4IuJuEVDeM
	YlbsTRPomNV71frkXBlOwfzFaE536TlIH4BQf9pNcScMhGZweSnwU7/Xrli/ruPC
X-Gm-Gg: AYBFou12y07moiCmjLS/RsBMdzQCrfGgSoDGh/3G/0ooLU+aYE1byIQxocxlBgTn2rh
	arHew9IxYPQPEE67ftUMwVKVvn+JI5Lv9IEmQ97u6FrL/K8dAFO8qVX+5acfV3JUS9WcRroiD64
	OlBaMQTNjRZB3EZjZSYQMf9Ic1FDd5IVXr9Wwyp7AqlLYKxSzM8nIPSEse5P008znUihSZMzt3V
	M6rQTCxB68gOUYLhOjNqoLRmbz0HOQVK1Lwa3o6cs402+2CoG8r6/dhdPe/RDFMrqsxbfWun82J
	T6k8B0iz3hKdHwebgapgYx/ZIb71B0Y/NTP5w/scsyeYXbdP92bzUEv+jrzOoD9OwMkFvx7tB5a
	6THCIXJdOaakrcJMozMAAkKVswkYQ5734jJn9OHv6jctY2KGZqCuvI/ip+yKq9hMobFzGK31rID
	ozusx9YNEdxbDhH/vokoB5xMIITjeoPe7+/QxdtIl7enm0rfk+P5i/xJRM03jdcxcC5GaJCiT0W
	Kj5/l3DVFpgtwYgwu+LPGLpSsstb6cIgzsR71ZgLLJoz7hEUZYVpbnxpaAEvNR1si/PD2TW
X-Received: by 2002:a05:600c:3b09:b0:4a1:f7f4:7ced with SMTP id 5b1f17b1804b1-4a1f7f47d43mr54411835e9.17.1792519827775;
        Tue, 20 Oct 2026 11:10:27 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581f0d4sm50665f8f.13.2026.10.20.11.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:10:27 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Marshall <pm@petermarshall.ca>,
	Hao Yao <hao.yao@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: i2c: Add ST VD55G0 global shutter sensor driver
Date: Tue, 20 Oct 2026 19:10:25 +0100
Message-ID: <20261020181025.8625-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020142641.24808-1-lsa.uz@pm.me>
References: <20261019162722.25587-1-lsa.uz@pm.me> <20261019162722.25587-3-lsa.uz@pm.me> <179243379000.31842.4735750009847702427@gmail.com> <20261019193402.52923-1-lsa.uz@pm.me> <179247822513.25202.7960395606350309657@gmail.com> <20261020085200.60619-1-lsa.uz@pm.me> <de8c6003-c7b5-40f0-beab-4c3370b98f09@foss.st.com> <20261020142641.24808-1-lsa.uz@pm.me>
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

Hi Benjamin, Sergey,

On 20/10/2026 15:26, Sergey Lebedev wrote:
> So I agree the register itself
> should not matter there; something else in v1 probably does, and George
> can narrow it down on CAMSS better than I can.

You were both right, and I have to correct my earlier report.

I looked at the receiver side with a CSID change that only reads
registers at stream start. RDI0 is set up for data type 0x2b (RAW10),
VC 0, with no ECC or CRC errors, so CAMSS filters on the data type and
the ISL lines (DT 0x12) should not reach the buffer.

With that in place I reran the exact v1 module that stalled this morning:
same build, 403.2 MHz in the DT, and the ISL_ENABLE=0 write still in. It
streamed 5/5 frames, 120/120 at about 60.2 fps, and 10/10 on an
immediate restart. Builds that wrote 0 and builds that left the default
behaved the same, and read back 0x00 and 0x01 respectively.

To rule out the diagnostic reads changing the timing, I then booted
again with the unmodified CAMSS module and the same exact v1 module:
three rounds of 5, 120 and 10 frames, all complete, at about 60.2 fps,
with no CAMSS errors.

So clearing 0x0329 does not cause the stall on this machine. My earlier
A/B was a correlation, not the cause; something else in those runs made
the difference, and I have not pinned it down yet.

I tried to count the DT 0x12 packets directly with the CSID's
long-packet capture, but enabling that capture changed the behaviour
itself (one frame only), so it could not serve as a passive observer.

Sergey, the write can stay or go as you prefer; the Snapdragon model
does not need it dropped. The 403.2 MHz link frequency still stands.
I will test v2 on the X1E80100 and send a Tested-by if it passes.

Sorry for the noise.

Thanks,
George
