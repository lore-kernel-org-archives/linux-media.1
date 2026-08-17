Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799EC3AE1A0
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 21:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003518; cv=none; b=SyVfR13XfJow3KczNk5rRuT7DCNoMdvN4Y33NOK5sLsWRERR6oFTADfzDQ8NFFJFfOQZsSRcd9xxROdBbsJOd+QqrivllCw1odkHKLT30maLkYoSxu0/guFIo6bVUfLL1FzrePavVH1QVb0zRP5Ar8ZH6nJGrN8tqpWQa5Wt9vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003518; c=relaxed/simple;
	bh=1OUwH3vpefuJTu+Cf5X1NgO2KYMRYxDAo1MiyQly/Go=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Cw3VEGiEGhRkD3LWPklPjnqq3BLWQgii96tTrWLge4ibLIo7WcOsY+xPh2B+I0pdmyNU3KFu2zjlKwlR/Gj8z2cuaVYv49F1X3TuPY7XKY/1yWs6BwW9CT/BFhFaVaHipmXd+wq9X24/NRusuk2v55NrxR/7Oju22dyb63ID+U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FgqCGRcH; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FgqCGRcH"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so35097395e9.0
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 14:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787003513; x=1787608313; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1OUwH3vpefuJTu+Cf5X1NgO2KYMRYxDAo1MiyQly/Go=;
        b=FgqCGRcHH9gMgXgzNRGLOMDqAN6BUbNQyL79vnhPflelKoUO9vKhwhQPhQGHO//Bl9
         9SOZLwynKnanaKNhJ+iGvh0BW7bncCmhu9HwE5CB7qAq61wxFmYtZnPCM6mrRM/IFjcq
         zCj0s0YSIdMoG/XPJynktk1hb1wnb0Q0L1mhfdrxaMQimKtiKj5/vVLtxr0vpvmodh4G
         zi1nUU9kkGeUcclauZvj15LEpykYNufMdU+RGiAfpNImeICzEqd30hXai0q2XfFX19Pz
         3IO96DHmuDqSEzmo0cmvnlX313f9NE8nwRJ7l2Av2r36mqU/cbiyq0lHGYSdW6e/KPk9
         O4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003513; x=1787608313;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1OUwH3vpefuJTu+Cf5X1NgO2KYMRYxDAo1MiyQly/Go=;
        b=VpPavWP3WJXgsI3o7z/4h9J/H8aIr8b1YS4pMmx9mtbu8ivWR0vUZilNdG5aB5wFjg
         yRAZof8Z/BSOLoy//YAYc2if/4OMbyzT7Jrv/7qokcGt0vzHwbONMYNEUBPlgCL9KQRU
         TnMuifpEHKAz3xQ8TNEI5XohjqwyvmpgHb2MJfUYL+PYCW5B6sdrynBmtyI/jtEVIp9w
         ix15r0pssMM1QVG3Ievdmr2BaZU2h6ul7mkkiuSLJUy52LMud8XEZgeVy+RcJdSaHZ3P
         zIdU/NULhA2ITQMWQaLq2dln9woU/9df+soMhkxgc5cBkrVSNKgQdnQF0keLu/Clga0l
         fj4w==
X-Forwarded-Encrypted: i=1; AHgh+Rr6uyZQRS7ymAD+dIvRQHNtAIIJGbzwqObcYyJT0a5s6tWKbRaVV0fu7Bs5uJGxHJq6b0V1DdPxRuQTCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/7KDaTWES3zmQXHVvR650CK/zpqsfI4KS/riq6y2K+gN4MKoa
	g/UupIBDJZkcmxocnBF9B0mtbq3xsL/4HWzEFCyPG3pqGGTN7tz6TRyh
X-Gm-Gg: AR+sD12mVYk364UhIh1PS4ekNqLDdbWWUnXKs7QaHOhlecfO7LHL3AwjOE5YEeiHbpU
	h8FTRfbatLu1qLH7SxD66JjHdDoIT6bfWwVXWnSBVKjNEwgw4hX7pEeMILxYq1xXBbjg0tj1Tbj
	ECH5lyk995/YdWu7vXYL4xgr70r8a1B/X+DUJrbkmNr4NYxX0dLTrivysnWHmYdxNbnfZEQjVeD
	kvQzgyXPjyt7KAeRCESnZIRIShgwLYG2paGAq1vN+b1iZgVf2mit9Cccx8vnT/xLzmx7eT0D0bq
	1nCqU5ZCjeaf/XLTKVcZ30rXg0Ny1GDMXyQcpgj3Xc5H2BS+72P0jGMp9bzVCOzTKOpsgiTvbQg
	sifUcDkCICS92pbh1WF76T011NgrCpXLekVcp9dHyPMnJ58310ohIUn1XngyEqOEYOREz0FhKmG
	BhZdKLAQIqh2VQb4bUfWGt54LOgE8g4Do+q+XmqYFKO4uSz2taV91a3sW0YgVk+m6pP/BOOOUcO
	TlJdcXPDGGNfOwYz8G6MyfxAZBkLDTwRPaENAzWIfCOsmSAI4SFN0zxJR5GQQm85GI=
X-Received: by 2002:a05:600c:1546:b0:499:484a:98e7 with SMTP id 5b1f17b1804b1-49987974700mr415672585e9.14.1787003512692;
        Mon, 17 Aug 2026 14:51:52 -0700 (PDT)
Received: from localhost (178.43.142.119.ipv4.supernova.orange.pl. [178.43.142.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a31572sm7076978f8f.5.2026.08.17.14.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:51:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Aug 2026 23:41:07 +0200
Message-Id: <DKRJNC8R41H4.1TJ6IRW0XR5XP@gmail.com>
Cc: <mitrutzceclan@gmail.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 "Martin Hecht" <Martin.Hecht@avnet.eu>, "Andrian Suciu"
 <Adrian.Suciu@analog.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Cosmin Tanislav"
 <demonsingur@gmail.com>, "Vivekananda Dayananda" <vivekana@amd.com>, "Cory
 Keitz" <ckeitz@amazon.com>
Subject: Re: [PATCH v15 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
From: "Artur Andrzejczak" <andrzejczak.artur@gmail.com>
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Julien Massot"
 <julien.massot@collabora.com>, "Rob Herring" <robh@kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
In-Reply-To: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>

On Fri Aug 7, 2026 at 3:02 PM CEST, Dumitru Ceclan wrote:
> [...]

Thanks for the patches, good to see the GMSL support integrated into a
common framework.

Small note: patch 16 adds a second config VIDEO_MAX96717 and a second
max96717.o. The old driver is only removed in patch 21. One symbol then
builds two max96717.o objects, which scripts/modules-check.sh rejects.
Won't allmodconfig bisection be broken for patches 16..20? Both drivers
also match maxim,max96717f in that window. The same overlap exists for
maxim,max96712 (staging driver vs the new max96724 one, patches 17..19)
and maxim,max96714f (18..21), where probing becomes order-dependent. Can
the removals be reordered so that these windows close?

Kind Regards,
Artur Andrzejczak
