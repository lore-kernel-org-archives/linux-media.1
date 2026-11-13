Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794611349;
	b=YZKtzyw9pWT0cAMG4rly1tI0+lgFwtJgzYAQbYwseIjXEQSi8//sXrvRfGzDTCmvaO1S
	 n/c1xx5dDaC6NERu429Nburlua/WeRXo+NQiK6roI7I9zlOICu+Guj+Z/fAmYBAcuu8fq
	 /f83m9KlkFP9Y3dziNvvMkexKC+VVhvCoONdXNopj2TBFejFmIXRfDuPsKlFY+HPWiTqs
	 QNEpuOt76uEdCyZUvw66ab6C9mpmTSZo00ntxuHHoj1Do33Ih6aRLPf564cS872FrYLxv
	 3Tdl6yZlZcNCG9NwLwCk79ADnTErwF3nKEmwDRxNN7YFDcgALOhorrn7sCL7kGqxBOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794611349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=leJAqwcnC8AWNGZv5jztSDYSCYhud0joE84DqDmbuPM=;
	b=1OhPMQzTtAnavHUMtX0qGtGl4w8iLl7UfQpkMf+lgMwLae/iYMyr7OEnwuevxM0nhRc9
	 NIZ5VzYdOVvYriAu4GVrvMS0pecT+ta291MuWi1UVPW119YtH/i/Ymp4Ud6CkeogfepQB
	 KGMPL1P3Mpwzsihyhqp5mtA5Jyf7K1BVlikc6+eltSqjaUZoSwY/UaDWx+uonptfiawTM
	 uykvt+NjYSt4mNV59yET+Z85dSH2LbO4FMka9kfLURfpttchX5sG7FePhhfWwdW5uI/8S
	 O1mCXjpgpmV3VTVU1MbJyAWB4f6NYFTHmQxehiKp5+rffSEwu4uoRUQGEMe51jXl7nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NMSNLcdm;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950FD606A332
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 23:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 950FD606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NMSNLcdm
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so11814535e9.1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 15:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794611347; x=1795216147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=leJAqwcnC8AWNGZv5jztSDYSCYhud0joE84DqDmbuPM=;
        b=NMSNLcdmqRQw1AuodWoXJ+hmdIIRuc5wGqpjScUVslTUCoimGW3+4wTRA3emZkygcC
         y+ujqh7G4JdY4AvdcFg81O2X+s5CSqcX+1Wi1BUEhITslaYM6gVCYyG7PJIdyTXNnTWX
         w+/Jn7IEjwN+nBzQix2LHc27Pt5EO85K/DQzydZKL1kxQz022QV5NNJys9/Byk1gMjm7
         7yjBGaszqG1DMFGv/9qBosbq8maXwJDWluWQQdYL6tKMX47l3tE7gVkU1BQwPb5PiQ1y
         kXFLtha9xjGFSs54Lsy0eJOXPHwZOZ8pfugTXv1fyjfZfIa74AarJZU+00lTeEYj17h+
         U+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794611347; x=1795216147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=leJAqwcnC8AWNGZv5jztSDYSCYhud0joE84DqDmbuPM=;
        b=o6mgAyzXkkSdbSbFCcI6wnQvZ8Biqqur7eRgoso605UnRAFTnVWCoOR97Jou+NDtxe
         hKkjSIpi9cvu/eZl/NVb6Yhdl3/CS/hQ6AlNA/afwU6mqVs0os7SIjBE8bGCo6r8eDx+
         EQq29i36pMWkoMdJj58IWdH5i5YFTU4oO41DSit7TsjGD8suGIlZVmJdzXyjtBnctecA
         rh1quXnziVC+0/f62vBIGgjprnKMjebcB2YXW9NKyO9og3roojPHPc1ncJbblXdwt1Sl
         ium5XWw5STzdn+i7woVPqe6w5Ik7Tm1bV4JcpIWPH7tAQeH1T9sUoQfAxyvXHaWfOH6F
         t7Hg==
X-Gm-Message-State: APuU4Z+n+BjhH2/4XVM05xF5i9k3plWV6Ajgg3B7uHbehxcr4o2YrvaT
	oMZh8NOMHQWJ9307IH2O7JYX8Vb4tTgAPNWb0S6syOi+azjS+/q3cR8m9TBTEPYQ+iXZHw==
X-Gm-Gg: AYBFou2suGJUp3FmrmsLuT3WfR8qpYlCJgAwGmzNHLGv9gtjayn1tDT29OStmnLZLzG
	6r0ymbShyU6MF/hH2wPcjJcOaOLjGlEXGjLaDDRxD1zMQBHgOcD/jCWsSS5+cZ2bOU/+72iE5v8
	e9m5d5H/lWUyowykeCj+9RjI9x/IshTw5BoSA1i0KWXdw0kg08ESkI5APKkZMgHS2Of8Rbt2mYe
	+rkMNQl10ER9kwGWGlgG0Ho5JuE6ooTZgkhxLBQGmffBHT3QSVrK/puVvUBzu6BT7gSLGeCc8zD
	4Sn1u53SbR71LTqfnxr8kabha3hdk7Wo7SwVD19AnE43GeOQkETclzTyu060N8+Ca3/YNsa6i0i
	2DnXcDONIJyw26msfTv34UDmG/HFKwkKIrJyGqzwKhC/ClnAd9SgJJ072uVHlcFaAcogkIBgVKf
	sn3Xt67mr/LH0aJsMvzD5O1cT6eyfryckv6vweQB+CNceJ3WKXxTgk8CGZrH98wvBembUc8gRRm
	W1U/AXmfuuwMf/iKvu0SQz5slk9rZO3XuocUktKWK7JAUwn7tb6htdDnxHToWJhAuJfBOQ0O2Wc
	32ZNG4o0OmZa5/SQ7BCgwKUaFxKhxL/2eVseVQ==
X-Received: by 2002:a05:600c:6089:b0:4b9:ff94:6b7a with SMTP id 5b1f17b1804b1-4bb55a7ed16mr85326295e9.20.1794611346603;
        Fri, 13 Nov 2026 15:09:06 -0800 (PST)
Received: from mahdi-MacPro5-1.lan ([217.138.216.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm7952517f8f.23.2026.11.13.15.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 15:09:05 -0800 (PST)
From: Mehdi <mah.fat@gmail.com>
To: linux-media@vger.kernel.org
Cc: Olliver Schinagl <oliver@schinagl.nl>,
	Mehdi <mah.fat@gmail.com>
Subject: [PATCH dtv-scan-tables v2] dvb-t: ir-Tehran: update mux list from live scan
Date: Sat, 14 Nov 2026 02:38:56 +0330
Message-ID: <20261113230856.2177405-1-mah.fat@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Replace the outdated two-mux table (602/650 MHz) with the six UHF
muxes that currently lock in Tehran: 482, 506, 530, 554, 602 and
674 MHz, all 8 MHz bandwidth.

The 650 MHz mux was dropped because it no longer locks.

482 MHz and 602 MHz carry the same transport stream (ONID 3622,
TSID 101); both are kept because either one may be the stronger
signal depending on the receiver location.

FEC, transmission mode and guard interval are set to AUTO, as the
previous fixed values no longer matched all muxes.

Verified with a live scan in Tehran in November 2026.

Signed-off-by: Mehdi <mah.fat@gmail.com>
---
Changes in v2:
- Put the channel names back inside the [...] section headers instead
  of '#' comments plus a generic [CHANNEL] header (review feedback).
- Moved the explanatory comment block out of the file and into the
  commit message (review feedback).
- v1 did not apply; resent with git send-email.

 dvb-t/ir-Tehran | 67 +++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 57 insertions(+), 10 deletions(-)

diff --git a/dvb-t/ir-Tehran b/dvb-t/ir-Tehran
index 9c28a776..19e09ac9 100644
--- a/dvb-t/ir-Tehran
+++ b/dvb-t/ir-Tehran
@@ -1,25 +1,72 @@
 # DVB-T Tehran
-[IRIB-TV1/2/3/4/5, IRINN, AMOUZESH, QURAN-TV]
+[AMOOZESH, IRIB TV1/2/3/4, IRIB QURAN, IRINN, MOSTANAD, NASIM, OMID, POOYA]
 	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 602000000
+	FREQUENCY = 482000000
+	BANDWIDTH_HZ = 8000000
+	CODE_RATE_HP = AUTO
+	CODE_RATE_LP = NONE
+	MODULATION = QAM/64
+	TRANSMISSION_MODE = AUTO
+	GUARD_INTERVAL = AUTO
+	HIERARCHY = NONE
+	INVERSION = AUTO
+
+[IRINN 2 HD, NAMAYESH, OFOGH, SALAMAT, TAMASHA, TEHRAN HD, VARZESH, iFILM, radios]
+	DELIVERY_SYSTEM = DVBT
+	FREQUENCY = 506000000
+	BANDWIDTH_HZ = 8000000
+	CODE_RATE_HP = AUTO
+	CODE_RATE_LP = NONE
+	MODULATION = QAM/64
+	TRANSMISSION_MODE = AUTO
+	GUARD_INTERVAL = AUTO
+	HIERARCHY = NONE
+	INVERSION = AUTO
+
+[IFILM HD, IRINN HD, NASIM HD, POOYA HD, TV1/2/3 HD, VARZESH HD]
+	DELIVERY_SYSTEM = DVBT
+	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = 2/3
+	CODE_RATE_HP = AUTO
 	CODE_RATE_LP = NONE
 	MODULATION = QAM/64
-	TRANSMISSION_MODE = 8K
-	GUARD_INTERVAL = 1/8
+	TRANSMISSION_MODE = AUTO
+	GUARD_INTERVAL = AUTO
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[PRESS TV, AL-ALAM, AL-KOUSAR, JAAMEJAM 1, IRIB MOSTANAD, IRIB OSTANI]
+[ALKAWTHAR, MOSTANAD HD, NAMAYESH HD, OFOGH HD, OMID HD, PRESS TV, QURAN HD, TAMASHA HD]
 	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 650000000
+	FREQUENCY = 554000000
 	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = 2/3
+	CODE_RATE_HP = AUTO
 	CODE_RATE_LP = NONE
 	MODULATION = QAM/64
-	TRANSMISSION_MODE = 8K
-	GUARD_INTERVAL = 1/8
+	TRANSMISSION_MODE = AUTO
+	GUARD_INTERVAL = AUTO
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
+[AMOOZESH, IRIB TV1/2/3/4, IRIB QURAN, IRINN, MOSTANAD, NASIM, OMID, POOYA]
+	DELIVERY_SYSTEM = DVBT
+	FREQUENCY = 602000000
+	BANDWIDTH_HZ = 8000000
+	CODE_RATE_HP = AUTO
+	CODE_RATE_LP = NONE
+	MODULATION = QAM/64
+	TRANSMISSION_MODE = AUTO
+	GUARD_INTERVAL = AUTO
+	HIERARCHY = NONE
+	INVERSION = AUTO
+
+[IRIB UHD HDR]
+	DELIVERY_SYSTEM = DVBT
+	FREQUENCY = 674000000
+	BANDWIDTH_HZ = 8000000
+	CODE_RATE_HP = AUTO
+	CODE_RATE_LP = NONE
+	MODULATION = QAM/64
+	TRANSMISSION_MODE = AUTO
+	GUARD_INTERVAL = AUTO
+	HIERARCHY = NONE
+	INVERSION = AUTO
-- 
2.53.0

