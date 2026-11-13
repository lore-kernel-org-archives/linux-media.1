Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604254;
	b=0XfsFfruX9xyF261zTRC8AgMI7YXckTzIgRO+X2OGEps72JHNUKrT6JDVOm3A4JD6hc/
	 Gr5aGgd08+AxsZBA98eVm/c2sOpK8m8GiauKhrokQ/VrPU/zZfGnfntxWA7B+syKIuPZo
	 bMgqFpZJzmr7jkWKkW7h0ab1zGyZkuiofIR02WYTn1alCrQK6tPlkS68O2opE34irPmER
	 jIodOpt8XstaGPdjuTndxvy2B9YH20xvZcUJZgT8JkqBxldzbd53FjK8y0alBEhtTr/9F
	 Ip5p9M1sdh65yCe/+bdu75ErAlHiqRGlvKT4Qm0VRG3nW+s+br6FGGJDRegA6F8tpqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604254;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GN0ortW4nQvstQDFiIJ5PqM8QgjEi3y1N04o3CsU+ao=;
	b=POfrX2bRr8HDPwViu0TNf/YgMyCiYWMoVWloIg2HqdPTpIVnrzyDG+wzEB03kYd5Nt7Y
	 CpfGqyJkFiHYD8LtQCMK91ikyiPIlre6EpD56vMg6VN6exPuVBhYUFx6D0iqGTixVMzo6
	 gVdusQ5MxPbmbPcOZs5RyJOVRzE6XjPjyRZBxEA2z7L3kFT0y61q5J5en0E3i1a46K681
	 h+fkJphkrxgRUN3e0RmJ4gPfXTDYUUzAtQ8xZsz9SeNFjNHB2qOziGQ6hgbzU1Tn4JYZA
	 n/4xDeZTyThAk9MQMgbDsuNlJcOmiT4mvepD982DW6Y4db6dgb8c4LZMmMaSzqE9JMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DD1606A335
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 21:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49DD1606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67c0ffaae1dso2631454d50.1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 13:10:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604253; x=1795209053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GN0ortW4nQvstQDFiIJ5PqM8QgjEi3y1N04o3CsU+ao=;
        b=1E9rXQnSrVCSQ7XVLSs8QpZpHHkrHmrqSzcqKXPfTjNeSPDSH4zoqD2g6DYKVYR4gi
         /9zaI1us3Yi4ezwp7/EvgLCcT8SVqHTH78Jlir+W0R1M/HGlOlxPxwngkEvs3hPA4ruL
         bKR5Kjwp0gxqGhp2xzLP1fg4H/XEPfrubPE2NYuAHDgCO4YM1OLaxNknXX2cq0Vgqm3v
         0l0SN++p/1q5PTQFgjJMpSjdvajY+KH5cOPYHzj22ClQhyrg2csbMzIvCrmDJoyAGyS9
         GqHInsJpXAC0s86Rd4FKJzyngB0CpWrXatcDhbb/OfDt/r45NhAkhIRz8KyVFqvD0pYO
         Gwpw==
X-Forwarded-Encrypted: i=1; AL+hErECosCFM+xO2SXupCt40FUFTwDFER97sBIFfP9HbfK/hS/OHcjf8k8PCpLu+cngdSWRC9T624rNqFAnPA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8tPlmOBrTpULLP8v2BCZzOQWsjb3rFY0eKQQgrRBZcDRcCMJjo
	QgZTk55BTTvOTij9Hfz6hz3zxrxRN9DlwKJ2isSuo5p15tMxykZnPH2W
X-Gm-Gg: AYBFou26SDnkCfSYlSpTV93UWcSY4fYQQJaL21jVCWspGZBCbf3Gpu02nILFXnj7C4w
	T7Zb3msogmaGPwLfKTetjET2GsNs7Yi7k0O8/rzMZfDzbXtKp49rHjIER+ca51z5qv72YTggb3l
	OFTEtd4fVLJx1SylQzpVAOF+GA8H53LWSXOXnJNoif4HLDlWnNyxmh83o63fOB9bW2iGwoIV7cp
	4jHyP5WMHT+31GNJrNduhbxqLkBFI2rILzKfx4pimKlDsvt96rLmQwZoIDpqSju44ltcTZCvKLJ
	svVGK7EHMtPY0GnIBn6lK/8WXExe5gufM850Usdt18ALnYN5kEBtKodRrSFUQHa9d/UwSIVdbOA
	cnEMTm6xgDADq7rThufcCsR5TaZQR9KyxtnTqEThGtcVRSKqLZEDPu/s6yUzsTpGyNlxp1uwnHA
	gyy6HAU3nlsS53plg2ykEQqJofYg8sr4edI2vCZF73Y3KDS/0zm07CHFEMJyq9cha5wGGOH4a22
	mcyjKeRbYTMx1d/R5XrkzJYBgJKNfKph152TQfV6UckfWeEVoUF4yn2Ov85oRTbphZKkEarHqgU
	RpGhG+ONcMohChbOYDbV5n4J3g0DNY4g6BXAXvdIJaHwzZT05U/JaaJWnEH7pI3GePxyientzjy
	OBwDnpp/zwhv+fCS3t8M1idJcGUVjqyVkbSwcVyYzbmUs3tVO1+dm
X-Received: by 2002:a05:690e:190d:b0:67b:fc94:86d4 with SMTP id 956f58d0204a3-67c78c3c92emr4305281d50.8.1794604253368;
        Fri, 13 Nov 2026 13:10:53 -0800 (PST)
Received: from localhost.localdomain ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a64b04bsm3050965d50.23.2026.11.13.13.10.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Nov 2026 13:10:52 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
To: dri-devel@lists.freedesktop.org
Cc: patrik.r.jakobsson@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	alessio.belle@imgtec.com,
	luigi.santivetti@imgtec.com,
	christian.koenig@amd.com,
	thomas.hellstrom@linux.intel.com,
	imagination@lists.freedesktop.org,
	frank.binns@imgtec.com,
	operatingsystemsdepression@gmail.com,
	matthew.brost@intel.com,
	dakr@kernel.org,
	phasta@kernel.org,
	sumit.semwal@linaro.org,
	linux-media@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	u.kleine-koenig@baylibre.com
Subject: Re: [PATCH RFC 00/13] drm/powervr_sgx: Add a DRM driver for PowerVR SGX5xx GPUs
Date: Fri, 13 Nov 2026 16:10:51 -0500
Message-ID: <20261113211051.88798-1-joseph@telaak.dev>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261112-powervr-sgx-v1-0-c69b84bac011@telaak.dev>
References: <20261112-powervr-sgx-v1-0-c69b84bac011@telaak.dev>
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

The Mesa side of this was declined, so I'm withdrawing this series.
The driver will stay out of tree. Thanks to everyone who took the time
to review it.

Joseph
