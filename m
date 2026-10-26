Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793005978;
	b=os+B6QOU79RE4dvMubPzc7YNr/u0eZ2tPzvpyGwRljqt6ESldSkt4dF2ECIxkYldLwFz
	 pBtsSw2Szaze/+TqjSA3bDhVMobiEIF8IvXMH+gON6SE7C17QIU7orCuR8EYZG5FDBGSP
	 fNdEaBWhUkPfRHYoAXT7JJQ+E8EahN0UDCZlDuhFctr/3NouEteMZHIIqu3ap4ad2TfhK
	 yvJYcyqlIoM9h13bURj/LxHwBPzqlfyJ/0Gzh4efqeZEAPTjLrCSmno/XFQWwoIY5h4LS
	 xxGEXErhnrHCKjPgBOM5T0h2Nnjc9IdXBY3CzyJeEBqRalhkhyD6ZhaICj1KBdRqK6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jOqGr+4VH9N6GlKfGmUukDwomZHNdNuh4F7gexUqV3o=;
	b=ViPG18IUF6XiH4TnzzTG9oIpumH91HKqPJ2nWPMD/+COkISYZ0ZOwsNjzovAtn5ia5yT
	 7GMYjHq+NiihG9E/5fuBAuXBni/4x6U9K5Lm3ZzXJY2af1QEmC7Xeinq4Bkf0oLdfEt25
	 buUNZVZ6ywVvCn7+z7SROC14IpCKCPhAwZBEqNah/cbV7EWM2sZgXtPaqizR7Yy1LdNU0
	 RxYzHSAj5AVTdQ9pwkAI1i8hQ6+gAoIXY9505Idjszv+ikVkGDPCxcyrGQQTWqp0djXTG
	 obaxwhV62Z/2xNHiUyUZMzprBisxYP69sW7qAZgSNLI8t+FB3Wyn4v9xyS1h9epSHhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mdS8MSbe;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2781606A31B
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 09:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2781606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mdS8MSbe
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso2027988e87.3
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 02:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793005976; x=1793610776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jOqGr+4VH9N6GlKfGmUukDwomZHNdNuh4F7gexUqV3o=;
        b=mdS8MSbeYI79Muy+hJjnohCiVzSsynw2fmRAW/u/+UoxVkZ14F/CcNqAKNShTqhGwF
         ji09kpzPhi+LR54m7vTSN1y9TNALdGiFNyfR6k+nCf+Ig4fyU93hG9+19FapsNW++ocR
         R2NkqLW0yfLAx6UOOtcX87auL0mz13gb9WjZ0WZ47gVUDvT3Axt6aoFgTZIYI3Z+UbKk
         U8AedD3NUq+8V3S/BIDYyntISSzP5DaJPEAoQ0I8HgraJrofQSNWaPN9zhP+baerHjOK
         WgmyV+txIAEMOo8/S7HX8KpPzy/xpHzr0NCFymi029ENv5IVlh5t83auDG9BzkSh5SD5
         AD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793005976; x=1793610776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jOqGr+4VH9N6GlKfGmUukDwomZHNdNuh4F7gexUqV3o=;
        b=rv34QPXVd9qRNJ9gOF7Ybwwx7LYiQJ+2ThOcpiwz/6OmlTNa3wMCpLnMWf8mmthc6O
         Jq4E9xdGUaA5IPeDL20YPmEsYgml9lnAHIN+jCeNu8Cb9UYZFuB2LtC0ixV9nP+RuLHu
         1oPAl/KOhbWpwR/DLVuyBMnbS61Zmf16zb4AjLoRW0/Eb6XU/2XwBLQ/2HLQoPjMKFOZ
         PQBxQ/Nk0+CILM90qR+rAR8hmTikUE0ltIkH0+pesMzhTMzZXH3p4XRaFYhnt3iZecwu
         pQWcJL4wJwmPxi7+0X6+eZp5IPIDreb7Kx3cvvmBcR+ZCMpr2rtf3KDdFdaA1XCnX122
         V9cA==
X-Forwarded-Encrypted: i=1; AKwUvBz9Sq6SHBXDceYPQyd/6LXUN+s4FXI2ds/3+MyZPnadX3fLA9JpVq/haIj2z796nukBuKPFMAotq2hRRQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIAfMRSq7lLcms2Su9p8q3FRTghdchCYdFL7NnzPYhoK9NC62wa
	/g2ngJfaYUlIie61BAAut811iIRiDm5IShAH58iTXvwwDmotuUQrZJMZGkV9cw==
X-Gm-Gg: AYBFou2HsAGsWS6scPiegFnnqjyPtTkmAtVG3Hldxyv2g8MgNFnA/BB9mu5+RvuhUq1
	ouckP8ADT1jE6f0nBfjMLPyPT+ouZkXHs6Av1lBYHZnFyYLKFCJl3kyc/K09qRApWagMNQMrRLv
	28qpx+8yAv/WekoYDmsxILv/X7rY1hy+gsfMNF9wcF95WLShVTuFZb3XE5s2NpUQ/4D4IVUqbeh
	J1RkdsL5VH2COOfLQFUjBxUJ+5QjCVHCG9LM2kI0gMqp6+klqJqlGe6ln8F2zHOLcX6rpHTGBlQ
	sqik3MIc7svaDhfF0SpMHwAUnx8/wmPLXJIdfuEVSwaPDqDLSaitxbf+kDyCZ2z6xT6Jfuh8DCB
	AA9NRoJBRc18eOMSwIgGddQ3HjyYoUUqvh+m0E+L6qNhnSQOi1kN7N6g4Bi/qi6pCmnRLb+ahVj
	U3UDknkKJyoM/EjpX/xaTihfzOJXbPys9J8qfm1PnwqkN7NLjeoPemJcBytHRFuGFLWUcAhiaP+
	kv02WSVLJ6c55jFZZUMe8BqYhVqCr83BCBOXZQAyCzH75gUmPolwuOR56/uYi6B6sH/7EO0IBku
	lL6gxPnqGux7LV+RtnJ1DGV1+Ddq
X-Received: by 2002:a05:6512:39c7:b0:5bf:b14f:beb6 with SMTP id 2adb3069b0e04-5bfb71ceab6mr1969582e87.55.1793005975522;
        Mon, 26 Oct 2026 02:12:55 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net (ppp91-79-33-192.pppoe.mtu-net.ru. [91.79.33.192])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac708ba9c0sm14694951fa.5.2026.10.26.02.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:12:55 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rillian Grant <rillian.grant@gmail.com>,
	linux-media@vger.kernel.org
Subject: media: ipu-bridge: lifetime of retained software-node properties
Date: Mon, 26 Oct 2026 12:12:52 +0300
Message-ID: <20261026091252.676350-1-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Hi Sakari, Dan,

While moving the LM3643 board description into ipu-bridge, I noticed an
existing property lifetime issue in media next d7e7bca71698.

The bridge deliberately keeps its software-node graph after module unload,
but link-frequencies still points at cfg->link_freqs in module storage.
The lens-focus property name is also a module string literal.
software_node_register() retains these pointers without copying them.

This predates my local flash integration, whose new nodes own their backing
storage. This finding is from source review; I have not yet tested unloading
a populated sensor graph.

I propose a separate media fix that copies the remaining names and values
into graph-owned storage, with a VM unload/reload test. Would you prefer
that as a prerequisite to the flash integration, or handled independently?

Regards,
Ruslan
