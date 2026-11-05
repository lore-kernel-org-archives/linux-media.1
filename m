Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839616;
	b=e37YkwWhVF3LM208jcECQWBQUcgxMNaJL+FFK8hgGuWDvbP8SjMBp6AQoY/nGF0SxOm+
	 fg94TDoItIc23QVW6s4oQigp8wKw0k7S6ZLyjW08LO8ynXqw7KMvhKcTJZaOPY3aCcKEd
	 qu4hPpBNgwtHfcTxZ9AIWj+EHvLDXNY+aMNqDRbIxWWALCh1ZvwXLwQ8/KvZWnChWtyDw
	 fVfHu+yaihFtVDnfEtKDfmbkG6JPuB+JVsMlJpI67ac04Kr+PsTXw1w3ll+931DK8x0YP
	 5C69gp8Irc1APW5oKOGsekElyfHpEjEoHURB5iN3tR60RSxEan8g665U6awlCSqmlGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+WxtuMhFn4fKtMVidfMWNFojAVD5ABpUs3kttOoaypA=;
	b=tiuhJZxkE979UFbwOKiW5bENlbmK4Wjo23pRBgmIMcPIpjEbXVhJpUXnDIEhmSG6isbA
	 RV4/Of5Ic2GTS6q05h1iV6O7+kEObfEoHUr71DjLn7AJM5muekaBPElSZ6O3CRC17jP3/
	 ND/6DA7bwANffNSgE/0xgnsu2qJ7di/xUnWKHMzlff97wNjNbA+oZgUbBOZj7ML2CBRrN
	 5phwwRwD/xuJRRpiLDoYFOpmlcX+VXLh1S27QNZCLOZw5cmI6qaFjtfrV4qJdsI1cLbqm
	 umfOejjQgvVpFrLvnRQQPqVLJ+02/dOsv2rpd9EFlztjX8MDgP7QFFqTrwMfMK0Bk8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mbLrrIey;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD9C606A332
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 00:46:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AD9C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mbLrrIey
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490c1d337d8so489580f8f.2
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 16:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793839615; x=1794444415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+WxtuMhFn4fKtMVidfMWNFojAVD5ABpUs3kttOoaypA=;
        b=mbLrrIeyjOy8ZkhAY/H3SfuKu7+3gc38rCo7WkglM1874pOmtYSwrnutvKEu1jWGIP
         ooQ1Lbtw3svobw8W/nZ/63lq1WWB25NC36H2pmWOh7eNdiLEXNgIrnlrRu1og9ghYIoe
         j0nbc9iDb8kbwjCgsaqZKFpQ6Mh8IlVhP8JTTFDHzVHvQ2pewGIHWlxuJwKsFmpEttFC
         e5S7l+8v9W2N1pud3XwzAO4BZ713vbPpc/iYK6SUZ0mjqCGond2E1+kSNb5IVw9+5D1H
         TzhhHXa3q5X249ICershaifTwJ3gXPlGqNH9I7aG1dp12S9M3JHmxzEAYYrH16gdqTg2
         z0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793839615; x=1794444415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+WxtuMhFn4fKtMVidfMWNFojAVD5ABpUs3kttOoaypA=;
        b=BOslDmSYs7VkprRqFiJieo1vQO4lty+IMnfqM4uxj0hpocNNGJ3a4F31f/nJ/63Et+
         2vPVleQ5/PQ2tgIg6g2DIXAKUf37P8rc1zBFkp4aGXiUlKdHN86vbNayzDpqy7b5hfcc
         RdSvuF2i9V/w+Mw3duw3epdlkTopUuhZ8xaQf1hI2WVdA7SB+jb1AcyrihA0IWCOlS8o
         dRLmJy8Pi50UpGkA6cAXvwJPaoZTZ1dsLJvAay9nnNaP7/AVcN1LYRyLKfdCM/ALqhFA
         QUdUP+GiNSTLKheVatXUDnwID7FN4zSEk/ToyMaToelyA5u8TNGzOwIrE0nu2zGy4F0C
         kJkg==
X-Forwarded-Encrypted: i=1; AKwUvBw2FCaRiHYlHijNCfPiYb76QqxElxM76qxIE9Abc0MxV0p0nJPbZKKNC6huprDXZmi5PO9EnZfY4HG8wQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+FlmYI7guyC0vmhYI9eV9czV3YX9BKng5752G+oZ/1X6/nVkkt
	xHnmAcb8PXFVVNJqJSVOt86m5wqymHhvP1+dqRwh1jHt2q1dOeJ+P8yJ
X-Gm-Gg: AYBFou0lxEFiPhfPz8y/8L2NfgdKwUxmTIn65Drilc+BcAnwG4PuQedQtW3lXZrhwH1
	t64mz/KOp6jCBAKqF6WcSbxeYu0t+u4S1FQzM0XFnC2YhG8tLAbNhcbvBpPA+TqxmuEhxal+uyz
	0v6ZUmAnOfi/M+2Z/dgUxgnx6G+rlNTHm3wRFKbdWKj3asmQVy6FsTbVkocrGKqrkeXVmVmX9TU
	HsoawAfnaXVZbEahJtAl7JupiHb736Xs48F71eVzLE/GeBpVJtNMMVC43Kd1l0gSKQNGCrbH2IY
	pNStRLYvcZlQpQ52mfnYbfWpHdX2RRGq7PNGyCQ6uE2F+dVVE5wfZhHKnQZdSD6nT6J6IFuBA2O
	lqFiqxGfzwz76Ue4g/n3GldkHvROXnQDbYp1FewR+j5ZmRsC9I5v82jVVX/dAPTfp+2bU31vsQY
	meGdnbFAob9MxhFUbOu0ETgjeWgD0nT8nDZkzGWzBt3FrZqbc2q1+5Ymk9k2XZyKfCYRbTFOiC+
	bBFo0z3ipoTMEoXKWRx55mQiI7eUqz+Px4npkfo4Nzns2MZPYbs9rfuWYHyI4/n+4DLErTQ+NFm
	9cRUTo9IyPitPiFnSIePDnVXYQXmgt6m1WW+I0iaqvR83CwjaIPDNqUz03tN+z8=
X-Received: by 2002:a05:6000:4908:b0:48e:7470:9e98 with SMTP id ffacd0b85a97d-48e74709f70mr34301059f8f.39.1793839614802;
        Wed, 04 Nov 2026 16:46:54 -0800 (PST)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea180ee1sm7735288f8f.4.2026.11.04.16.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 16:46:54 -0800 (PST)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Alain Cousinie <alain.cousinie@laposte.net>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Milan Zamazal <mzamazal@redhat.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Robert Mader <robert.mader@collabora.com>,
	libcamera-devel@lists.libcamera.org,
	linux-media@vger.kernel.org
Subject: Re: libcamera: pipeline: simple: Disable packed mono for VGA sensors on Intel IPU6/IPU7
Date: Thu,  5 Nov 2026 00:46:51 +0000
Message-ID: <20261105004652.147540-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6cfa9260-b48d-484e-9c88-b75feb0392f9@laposte.net>
References: <c218b8a2-9e69-4ef3-b36c-7df7e7637d4d@laposte.net> <3a98bb5e-a4c4-40b7-ad4d-1b251c03b4ff@oss.qualcomm.com> <20261101164311.GA3368923@killaraus.ideasonboard.com> <304e2a5a-f8d8-427d-84f5-b6f4498452df@laposte.net> <20261101195019.220940-1-fernandorimoli11@gmail.com> <6cfa9260-b48d-484e-9c88-b75feb0392f9@laposte.net>
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

Hi Alain,

> I am using an HP Spectre with an Intel i7-155H processor.
> The camera relies on IPU6 and uses the `og0va1b` sensor,

So Meteor Lake, which also answers Sakari's question about the system.

> I modified the driver to include the ACPI entry `IPU_SENSOR_CONFIG("OVTI00AB", 1, 500000000)`
> and adjusted the frame rate to 240 fps for a 640x480 resolution.

Your failing run changes several things, the link frequency, the
frame rate and the formats. The stock ipu6-isys already offers R10_CSI2P
for a Y10_1X10 bus. That is what I used, with an unmodified isys, so
nothing needs adding for that. Does R10_CSI2P at 640x480 still time out
at the driver's 60 fps, with only your bridge entry? If it works there,
the stall comes with the rate or link frequency, not the stride.

Fernando
