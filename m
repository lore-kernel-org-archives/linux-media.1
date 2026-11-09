Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242529;
	b=rvhX0P9yGYQO41ZwrgNROv+5zC2hJCoz+T2Lph65oWpcGlSTB46etpqf+/CjvtTnhWoD
	 izWXItk/KKoSXXaXAQRvTuT0JwuP3qwT4AoWs3G/vNAF7Mi3IEM3cBZ+Hb37khGR2lxgF
	 CnatqbEyEkEtYE1aEf0f1DraFgJQLbeXE8bClZCHG9fDtk46BtQzKKevxByTAN2X7cVlX
	 gu8+wtO8eXkp/csecdf2sUDXkxTWEwiHckb3ZSfcRoQ6CP4FcgmQsbQFRSfAKJtMeY6et
	 /5pd8LzUzwoOPW29NlOpu38KlUQStTCuNGenZef8M1y+f3++fYtiCB9lXwjA+9+1eYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rTBkN4SoXpbnTrjKm6a9r9Hi9WyVrqwpfUB5k5zGKJU=;
	b=xi6obiwpxHO+/CWgjS9j2B3r6pagcUCITRr/Sch+A5BJYcRFSXn8LevgFXfmQNCpeUnt
	 pPW9yaJ5b8HM+IWDHd1lVl+3VLXmt9wIiIUUDmQgS3Gigg3aagZShKqmxKEpQ8hfMMelj
	 VMD0Sd6h1hVsCQG/MOwKiW3thDfp3cMgiR6VcvXxkkKmJbJ9ev56SFMb6jNJJ9PSOglgv
	 QlKfZRtefrMi+KCMZJj3WY9+Bjwwte/VnKkmTyfXRoLI9jrHLfMEssjapXCDZNu7tPngq
	 /pJJOUHh4ln23tApYRDQD3tqUfkjtT7mqUg15PjgvkBBoU/SkJ73kdIn2jFrZYFazNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fk/Wy5WQ";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212E7606A325
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 16:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 212E7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fk/Wy5WQ
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so8824435e9.3
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 08:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242527; x=1794847327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTBkN4SoXpbnTrjKm6a9r9Hi9WyVrqwpfUB5k5zGKJU=;
        b=fk/Wy5WQCkWdrah+qLMkXKaos3bTrw3VzUEGV9pSdILWJp2hlmbRjEzGBmV1bKwBJy
         XxBdw6jsIznlDUqJUlEUo3FwW0YnH7+a3nfRimB4b4WzowxYh803gXzalSJFwzfkMXYl
         1rzi9QoOuS1UTNcE7mQHA6tESqziqaEBvmpsckEZ4PwtXmuwFS84r2vvpl6M50bORGdq
         IFlGwM4zwaZmLsM3IvPqQ8nPz5tB1tcfuUQvLinXbWruDJFjdNxmUczmwB0r6DF4Ko1Q
         Jd13Tq9tesDAqI7DZAR8EXNCbZr0F4/K8Z69mU9CiXtpZoOLHmFPUdwq2RMB+GhZ+B1C
         SH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242527; x=1794847327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rTBkN4SoXpbnTrjKm6a9r9Hi9WyVrqwpfUB5k5zGKJU=;
        b=RB4M33JvqEQY02NF81xFeaGNM+wdaLWhHm17AnNaFEYkQna8Bg6Pt7I2F5aHKvXoec
         xKYbCQer3ne3bEZ5ECnpuXkQa52MHFXnii7BzqsFHxzBZKm93tZDzeWqpRjsS5MIuqXr
         Lf5kZ3+JsJcA79tss2wqCtDmrX+GvjjxhHEHAd+Cn8gzXeUbhWojhl8JlCoGHih2X+Wd
         zr8HgyqHCpVrZ/+urfhBVvrqQM8TstZxoM3d5hKwOIPLETFWhTVUC+oz5Dqo1OP/lBBl
         ajmS9oCqH4G2xgox2x/DoaULep23GRfapdTMJeTsbZhhYBl9HCV+wrD0tuxbGmvVlYGF
         tDvA==
X-Forwarded-Encrypted: i=1; AL+hErGl2PxDkyQZmC1VEXzjiGaL0/A9Ci+emQ6QBZFWdMFVZvD+2L1VYx4deK6wYl+R+hklMy+MkeYHyZFMRg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/JLHxKWcdKczE1S19wpTivdPXGOMYDM1BAq41ygRmNBtB0yeQt
	hj8UpW3yuaay1HBH0rOnok/wSTCAjV0OKNrsGB7VWapkNgxXRSmJEnI=
X-Gm-Gg: AYBFou1LMIT6nK76eEW5DTWClbE8O/B5FiTXKEH1xNAWYfj1uByPZQEsT/yEtYlwv2j
	0SScuTHVMZcRQldCnR/25cfh6S3evtLDHTPGD8fSQiqhsCPcPt4vDp6gLlbiJQZX44xK/yfHrXl
	uvW9yLXqpQlqkPlRM8f7qGbjvFoepJYd9RPdGlEB9SsC66krTqO6wRD52TQPezZUgyxXnKWD1Qs
	QfslIiLshODemD1TfPv48ffJ4X9/Z1dCvnIte88O8fGCeGGOiz3IW6E7Orc5pIPgwEnMUQeKsX8
	Rlnhlwk8V+pdg2qkjBdzM/OVcFcABMBG0yuRSq9B2KuYf9vmqSkn1ZKCuflEiwtlTlRguljzKId
	k8S9dLwX7qtL3dGZ99tNQBqpULtcPsKO+A+Hnbzjs+IA1lHntmgbU2iXo0UlhRziMahPtBAU/2M
	fi6aXolrro7oHygVQ8jzKQyBwodRcOj993Q2Ms3q5QQ4jP+rFlIfElIyLshCCAdzAR95st1b2Bh
	084fD61yqn54L5qrjQYS9Nmd05vhAR78pu2pt3TbEv+yU6ftBYR1gy05uNfnoxDn915CMqijYO4
	DfeR4TXChaSKnga5brcVeHF6/s2eGA53oJqSdmKmxN6O09ecXeqdrRAz+L8n7tixD+iSaOfR24f
	SnbiDYM8+BhtWngnW3OR6Got2dZJR1OnSNdjyg47WFwFxANMaUahmt1ehqeWIir0J2auNGLOUDg
	==
X-Received: by 2002:a05:600c:8b24:b0:4a2:d:5ccc with SMTP id 5b1f17b1804b1-4b960d9b66fmr79533325e9.10.1794242527085;
        Mon, 09 Nov 2026 08:42:07 -0800 (PST)
Received: from chateau ([194.65.85.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597371cc4sm10639482f8f.36.2026.11.09.08.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:42:06 -0800 (PST)
From: Sergey Zagursky <gvozdoder@gmail.com>
To: Arpith Alexander <arpith99@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Jake Steinman <j@metarealtyinc.ca>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] media: ivsc: csi: Add sensor node in bound callback
Date: Mon,  9 Nov 2026 16:41:59 +0000
Message-ID: <ivsc-csi-tested.20261109163952.eaa256f0cc02@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103200226.100989-1-arpith99@gmail.com>
References: <20261103200226.100989-1-arpith99@gmail.com>
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

Hi Arpith,

Same regression on a Dell XPS 16 9640 (BIOS 1.4.1, OV02C10 behind the
IVSC, HIMX1092:00 in ACPI). I reported it before finding your patch:
https://lore.kernel.org/r/20261109142140.ov02c10-hm1092-regression.e938253b8516@gmail.com/

I tested the same change (identical apart from the declaration of ret)
on CachyOS 7.2.8, with modules built from kernel.org v7.2.8 sources:
- 7.2.8 plus only the HM1092 entry from 4fdb0342f05e: no sub-device
  node for the OV02C10, libcamera skips the sensor.
- Same plus this change: the node is created, libcamera and PipeWire
  find the camera, and "cam -c1 --capture=10" streams at 30 fps.
- This change without the HM1092 entry, so .complete() runs after the
  node already exists: still one node for the sensor, streams fine.
No kernel warnings in any of these.

Tested-by: Sergey Zagursky <gvozdoder@gmail.com>

Sakari, if you pick this up, could you also add
Closes: https://lore.kernel.org/r/20261109142140.ov02c10-hm1092-regression.e938253b8516@gmail.com/

I used an AI assistant (Claude) to analyse the problem; the tests
above ran on my machine.

Thanks,
Sergey
