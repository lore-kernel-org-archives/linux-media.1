Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9E8304BB3
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 17:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785345927; cv=none; b=tTNfaIRYOQ+TfPqeszw3qaymKkLOZepCEdiZjp3EEyE9tINWomF1WQXHMZvsdjhheYzRQ2JXWmnumVqCu00qyjV65pxRx5IAX0RSmBeAmLl7Ta43eU7m2fxzYO2HYbtME3RJlKESFLwZ3hhS6dOEmUJPUIhpo3Ogw9au8+9a1Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785345927; c=relaxed/simple;
	bh=JvnrDIlH3YvcaZO2u9GL9D42hpM8RWYDtOLL0xUlXfU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q2X6Ud0CvXKqCD9M15uCJICsu0BvW0WT3oqIIdYhy0mlsM54Tc2nCQcD8t8GPh7D6XKbVQISc/B7Ej5Oh6ljz8Ed4994FCoMShAQPx8PiDryG/m+P6iMfhsOg0p15vYDHTnKIx4H9NVVau+zsfxKlMjw2ov0XcGOG92T7YAnySg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca; spf=pass smtp.mailfrom=metarealtyinc.ca; dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b=GiN6Vzj5; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="GiN6Vzj5"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c2a449c57so7727011cf.1
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 10:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1785345924; x=1785950724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j1ThhqHWLasqXsNNivgLf6E7ELPcjV9s9p2Gn8/XL6w=;
        b=GiN6Vzj5Il9zGPb89keaEymPnxAv1ic4ih9z4MEAhWYE9S/nuRmK3T7DhQZgvJ9l2q
         vXU80rZ0n8nsxzYhD97lLf82TJFv/bd0v7W65Laka6EetVKlCkC1L2xsaOFJbcXQCUJL
         lbk62T7FzmkgXpLtAK+6FseipqqocWBrwhkfRsqaifOb211Ljr9xBF0qXBREgg35vkIP
         Gr2u6fuhhO7dfkYLeI70LrjSDrRYB/4EEUpaBer0IdVn2GnNgOMGaEtappuDQ+Clwjqe
         2ZGqXmtPH8MXCtRg4G8YjAib6haCLlWbNVuEeYN4hOj/H+d8cK7Tn7wHnDOYKxwcdtaF
         y36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785345924; x=1785950724;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j1ThhqHWLasqXsNNivgLf6E7ELPcjV9s9p2Gn8/XL6w=;
        b=EvHOzfHrG8F6+VBOcYIVfxipF0Xwn3jxH7SJcOCFhe9FodvnMxukl4ZC7nCrC6hD8n
         tdIuqKNdv+9f8yg+WupFUwIgp7DgNH2gi8bjLnVBLZaZNHC9Sae0t1vtmRAerG8T+A7d
         3H6TE86KEkHeIBZYj9ekX5YZw9TfwGkJrON+YFeZvkqhCczMhpsQAgKHvfE6EnBV3Wm9
         fRWziJ+AdiL4sq7SGxciHE644YvhjPAhi3kT5oU1jKbZr0q6XykGquYGsUAKj9olb1mf
         VDzs6+sUagIZoGZNMtYLp65i+apvnKHqk5mo4oagHvVxoSYk8naKtxARmV699i/01wiz
         Fd1w==
X-Gm-Message-State: AOJu0YztmnwaPvEyjK/KznVzlFtD9qdzrLrsvGbU72SzrfYXKBEzGRD+
	p7Lt9Qnu7M/t6h/8vfOFca5pmif4A5eamT2IlombNVEv/X9hZ2F/Xc9hftHy0VMHG0M=
X-Gm-Gg: AR+sD12rgHwAoNnCOi/jYY6ZExZtjdBVGoKZ5OcfscjGp5Au/PWCXMMh09rVUvDLknm
	67QO4IzRTMQoh9CPcOVV1wXRyg369PUrt+01/Vmrv0Dj9SpHj/3iGLHAlsUtsZV95tbHQ7vWnW3
	TlQ6Dc7F2s3bNEngOY7imvEGJlkx9G3mjq8drnJWij1uA8YRtvXGSwSfhEjNnp4peP6GOo2gWa5
	DuwNFim4qriRdpdAzj1NatU0bk0O+gqnzXCWzpt1w4PlTQuvZWBbYQD13urGHxHsX5FtQef/xpt
	7H/kPyM2aWJn/MlydYtntEmsY7LqxshawrhixfkcOVazjWXw6AHYHJmXdfKDJQcS2b0qnpXTL2W
	fJY/2WCzHE0K/PjAh/tuUZwbFzGnof0temDh8pzAieIFR+Xn77i/L6atXviVFZXWhwVuPCKeAK5
	xcjQ8LUT6DMuDQjN4NZIzTa5ChmaxKXlBOaOADjjG7Cs2G+x3wtYw++QyH1VmL6sBqpAaj9ep4n
	V1wVG0DhFC4eQIV322ke2erIRM/YbiC8r93FbXOOwGC4smljRLOKDR+HK5LNLPgLtc0mp4s3fJ3
	WTHp1yE7dgjdQLDd3g8xNQv3hoVvPkMqihg2zO2rBjg=
X-Received: by 2002:a05:622a:590d:b0:517:5b2c:6aae with SMTP id d75a77b69052e-529d6faf050mr67805121cf.13.1785345924466;
        Wed, 29 Jul 2026 10:25:24 -0700 (PDT)
Received: from jake-laptop ([2607:fea8:e5:500::f163])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e2b67050sm22994301cf.12.2026.07.29.10.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 10:25:22 -0700 (PDT)
From: Jake S <j@metarealtyinc.ca>
To: ramshouriesh@gmail.com
Cc: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	hansg@kernel.org,
	mchehab@kernel.org
Subject: Re: [PATCH v6] media: i2c: Add HM1092 camera sensor driver
Date: Wed, 29 Jul 2026 13:25:19 -0400
Message-ID: <20260729172519.1079858-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jake Steinman <j@metarealtyinc.ca>

Hi Ramshouriesh,

The comparison you asked for is below. Short version: your 180 MHz
derivation is independently confirmed by the Dell platform, which reaches
the same place by a different route.

I regenerated 238 (address, value) pairs from the Dell hm1092.sys mode
descriptor and diffed them against your 185 Qualcomm entries.

  registers present in both      178
    identical value              162
    different value               16
  Qualcomm only                    4
  Dell only                        5

162 of 178 identical across two unrelated vendors is, I think, the strongest
evidence either of us has that we are reading the sensor correctly and not
transcribing someone's platform quirks.


THE PLL, AND WHY OUR NUMBERS DIFFER SLIGHTLY

The clock block is where the two diverge, and it resolves cleanly:

  0x030d (pre-divider)   Qualcomm 0x0c = 12     Dell 0x0a = 10
  0x030f (multiplier)    Qualcomm 0x5a = 90     Dell 0x5e = 94

  Qualcomm: 24.0 MHz * 90 / 12 = 180,000,000 Hz
  Dell:     19.2 MHz * 94 / 10 = 180,480,000 Hz

Both land on ~180 MHz DDR from different EXTCLKs. Your ASUS power sequence
requests 24 MHz; Dell's INT3472 supplies 19.2 MHz, which is why the driver I
have been running publishes 180,480,000 rather than your 180,000,000. Neither
is wrong; they are different boards.

The implication for v6 is that EXTCLK is not a property of the sensor. A
driver that hardcodes 24 MHz will compute the wrong link frequency on Dell
hardware, and one that hardcodes 19.2 MHz will be wrong on yours. Reading
clock-frequency from firmware and deriving link_freq from the PLL registers
is the only form that is correct on both. If v6 already does that, ignore me.

The same applies to the init table: because the PLL registers differ, the two
platforms' tables are not interchangeable verbatim even though 162 of the
other registers agree.


TIMING

  0x0340/41 VTS    Qualcomm 0x02ee =  750    Dell 0x02e5 =  741
  0x0342/43 HTS    Qualcomm 0x0650 = 1616    Dell 0x0654 = 1620
  0x034c/4d out W  Qualcomm 0x0230 =  560    Dell 0x0288 =  648
  0x034e/4f out H  Qualcomm 0x0168 =  360    Dell 0x0170 =  368

  Dell: 36,096,000 / (1620 * 741) = 30.069 fps

which agrees with what I measure on the hardware. Your 29.703 fps for
560x360 and my 30.069 for 648x368 are the same sensor behaving consistently.

The remaining differences are all windowing  --  0x0344-0x034b crop, which is
what you would expect from two platforms choosing different output sizes.


EXPOSURE AND GAIN

Your register choices match what the Dell table does:

  0x0104 group hold        both present
  0x0202/0x0203 exposure   both present, 16-bit split across two writes
  0x0205 analogue gain     Dell only in my capture
  0x020e/0x020f dig gain   Dell only in my capture

The four your table lacks are the ones Windows only writes during the runtime
AE loop rather than at init, so their absence from a static init dump is
expected rather than a discrepancy.

One caution from experience: my Dell capture is a whole Windows Hello session
 --  init, stream-on, the AE loop and the teardown, including a final
0x0100 = 0x00. Replaying it verbatim and then calling stream-on made the
sensor arm, disarm and re-arm, which no real session does. If your Qualcomm
dump came from a similar capture rather than from the static table, it is
worth checking for a mid-table 0x0100 write before trusting the ordering.


IPU-BRIDGE

Agreed, follow-up patch on top of v6. I can write and test that one  --  the
IPU7 path is what I have hardware for. For reference the entry that works
here is:

  IPU_SENSOR_CONFIG("HIMX1092", 1, 180480000)

which will need to become two entries, or a firmware-derived value, once both
platforms are supported.


ATTRIBUTION

Co-developed-by, please, with my Signed-off-by. The register map, the control
register assignments and the link-frequency analysis are my work, and you have
said v6 folds them in directly  --  that is co-development rather than a report.

  Co-developed-by: Jake Steinman <j@metarealtyinc.ca>
  Signed-off-by: Jake Steinman <j@metarealtyinc.ca>

Keep Reported-by as well if you like; the two are not exclusive and the
original finding was a separate contribution from the control work.

Worth stating for the list, since it is relevant to how much weight to give
these numbers: the link-frequency root cause here was not a guess. V4L2 defines
LINK_FREQ as the DDR clock, while the vendor mode descriptors publish the
per-lane BIT rate  --  twice the value. Every published figure for this sensor was
2x too high, isys ran the D-PHY at 721 Mbps against a sensor sending ~361, and
nothing framed. Correcting it to 180,480,000 produced the first frames anyone
has captured from an HM1092 on Linux, and that driver has been running here
since. Your independent derivation from the Qualcomm blob landing on the same
number by a different EXTCLK is what makes me confident it generalises.

The comparison data is here rather than inline:

  https://gist.github.com/jibsta210/db457ed67e24454e834b9638f6d38037

  hm1092-dell-vs-qualcomm.txt   the full diff, all 16 differing registers
  hm1092-dell-table.txt         238 (address, value) pairs regenerated from
                                the Dell hm1092.sys mode descriptor, in order

Regards,
Jake
