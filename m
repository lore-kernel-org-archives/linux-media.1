Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794515819;
	b=bRdnyw0Q1qzv252knyLYH+fVEzWVyEetzuDFnwCMw3WLOE3UmavJBxbeG+u25fK/YtFo
	 5nXf6ACcV3bnEdCqXPBgwWyRZLHe4b0mA3P0i6bfos7B3FEGRSf+7y0zPEHGlJ+DOGJo1
	 cSbcUR6Nz87A/3+hUw8i7xV6XY3Ip1X5IQbEfHHbEz/EiUPIoww1f+tHLOy838Emf3C+/
	 1lUw5AZLiGAY/uTokOLuQ7cs9yH1cJ6J6KF0giDb8eCScBUP+BBk4H1pK7uj/33mclJUi
	 BhtTcFkV+habvXoHjpntK10wEDZ+qeIny6IlGtOwT9CVDGjb7Ip3LZTOl7a4lQrh5bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794515819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Content-Language:To:Cc:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=VrbOVMVP1GCZ/DDTVVvY5WKPxg8sm/m9t9kUwfsodGg=;
	b=zUi/kMsubK6nqSGgIMveUnxxG5sRXmlzztaXxGGFThx6XLbVti4fqfV5xDkRS+a8r/mF
	 vDpP0p9fh6J8KYSR/1MdLzGzp3mgMV75EmfhMnmwxtB0t2Sl0ZmBRr8uq3m4KdyWgY7CN
	 SBEaHuvrFCdSoNW748OMo6anbQtFfrPy7ey9rr0XyH6FXscegMQ6uj7KUF9azlyT2bnhq
	 lFS++INPcbhqYLp6RdV9DAY84U9QN8VPaTlVXI+7GuwltEcIDSoSpf8ygEszG71UHWRem
	 yXickU7R2L2goah5VHkkGT0ZtKIRcUTGQawgqKD28+w9l7CmaPx4TJPRDybNcCy1jfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LYsVlCkL;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F43E606A331
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 20:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F43E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LYsVlCkL
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso19280766b.0
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 12:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794515818; x=1795120618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VrbOVMVP1GCZ/DDTVVvY5WKPxg8sm/m9t9kUwfsodGg=;
        b=LYsVlCkLO20yi82jv5VVgdV0YAiEp54cswp9q8R85TeiVrzrzPcuia7uiY/pSJ4+Z2
         +d6c+FBaSSAP0aS+NNg2lURLPfHAejVXJQiPF1AowTyQ1G7dAIhyLF3j7btd2kSKI9jj
         DBmMIm4XBHFI9ip07tEQ5AUVCsNNzgKY1RLQRTSbhhlKHS0FSYrNvvEQyqhbdUiqDGxy
         +WNOXHRsxt6Tca/nuo3k9OEcH+N/3NKWEXKHCuO2X/ao/5Wz/JWKdUJMJO/eVhWlWOoQ
         fIFml0nuozO40YXv3lWG2gDR1gIslJtEKIrH+ZV+82CG0PSMpGJSkQ06CQA06TCL/YLN
         D33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794515818; x=1795120618;
        h=content-transfer-encoding:content-type:subject:cc:to
         :content-language:user-agent:mime-version:date:message-id:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VrbOVMVP1GCZ/DDTVVvY5WKPxg8sm/m9t9kUwfsodGg=;
        b=0lGErzYjObLtKt8w6QpOtHp6qm0bcw4QmpwtDRd5sbGTS0deJQCFqGvCONgmiwr9kA
         lQF4etroJS9XqFQGFalqZUdUgyWayIkovqiYoGl6M0XgImi6S6gxrMAjdv7vhBevSjfz
         DGSFi0vMuSFOptGI6Zt45Dey8e1a+HDszLHQWTZ2aMNLtZP6igkmKZjNZefEnLsi+Nj/
         u6g0Cl+HFyBj/V8X7Y7XudQotJJpLyRDI6iSUumbyyqrxUs1PIKqE51xgxCbSh7mH1e6
         U5nBYzIcqsLn33FWQ/FwBM1GA8Xh/mVHjpS9otsa+E7eCOfqJrGN4I7PHEk4yy2LbWpF
         VH1g==
X-Gm-Message-State: APuU4Z+xVKbSBXEZ9cfsrINebF3gPx6nbk7FPJ7YgP6AIPqBnAUwn8K5
	YKxNnoK39p8/aAj7h4NTqRUdbKO4SMwyOXjySahoVgBaT6mJ/9SkOAOCet0B4A==
X-Gm-Gg: AYBFou11upREGtDJHt3uFhwcmUpPEEszShfINj2pzHlnh6oywB/ThqsTiHbxcbbbY5n
	CwxLsxgkpcAXfr6bgCz7naf/7OY/5ml4geaMCnZE4qTlOKJ/C+4gp2qx5NmWm4s0DYPleMwXd92
	9cOx1GsWp3uAOum6qKtCQaqKPuxzyZ0CpFF5EgKslcTD5q9ILKbdL1bIxEE4Wjd4bs2SofXENJm
	Sevs2KkA8gtPYlJjqhD0dyDuEl7Dpki8UtA4FhEsb6KaECpdLvyFmKUiYLq0l3jTLepU4h5Sa5c
	TNmCvlGjK2RzYLpT3jPYnl3rLvTotwiM9shJjlDy0qrKooz91oLHCd9RyekDW8WPtZ5EtQ301En
	KMX5DEzN3pMh5cfC96jblsyX1NKP3FKHaROmnkW91A8//CBgVXTqN4JiD35SfnvZHx9ZFw+Hhyr
	Lmh859dqwyIpck30G5c918w6xwN8afRYU7nd7JXS/pgUxCCmye2gMkNdJ4Uyn9gS35WVyDOkeSf
	S3nkiJZ9zm8MYk70FEWJN3jqejuqMfDdQoBP5ps1rIigFWHRx4YUPkEYkVrGei0GoxbLWDKCUQO
	F/5rw0eV1GMNbvh0bcc4u/NyHsxLYDbObZLa25Pa
X-Received: by 2002:a17:907:3c8d:b0:c40:2439:4d9a with SMTP id a640c23a62f3a-c507c46428bmr358298866b.28.1794515817574;
        Thu, 12 Nov 2026 12:36:57 -0800 (PST)
Received: from ?IPV6:2a01:799:51c:9700::3f4? ([2a01:799:51c:9700::3f4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b42163sm15216366b.41.2026.11.12.12.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 12:36:56 -0800 (PST)
From: "=?UTF-8?Q?Bj=C3=B8rn_Ove_Isaksen?=" <bjorn.o.isaksen@gmail.com>
X-Google-Original-From: =?UTF-8?Q?Bj=C3=B8rn_Ove_Isaksen?= <Bjorn.O.Isaksen@gmail.com>
Message-ID: <acf365e6-5418-4150-869b-f3b1c962f83c@gmail.com>
Date: Thu, 12 Nov 2026 21:36:54 +0100
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org
Subject: [PATCH v4l-utils] dvb-sat: set LNB voltage and tone for all DiSEqC
 ports
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

 dvbsat_diseqc_set_input() only derives the LNB voltage from the
 polarization and the 22 kHz tone from the band when sat_number < 2.
 For DiSEqC ports 2 and 3 the frontend is left at 13 V with the tone
 off, although the committed DiSEqC command carries the correct
 band/polarization bits.

 Multiswitches that select the quadrant from voltage/tone then always
 deliver the vertical low band on ports 2 and 3, so e.g. a high band
 transponder locks onto whatever low band transponder sits at the same
 IF.

 The limitation seems to come from the tone burst, which is indeed only
 defined for two satellites, but voltage/tone selection does not depend
 on the satellite number. Set them for all committed-switch ports and
 keep the old behaviour only for SCR/Unicable (t != 0).

 Assisted-by: Claude:claude-opus-5-5
 Signed-off-by: Bjørn Ove Isaksen <Bjorn.O.Isaksen@gmail.com>
 ---
 Setup: openSUSE Leap 16.0 (v4l-utils 1.30.1), nGene/STV0900 tuners,
 4 quattro LNBs into a Megasat 17/8 multiswitch, satellite selected
 with DiSEqC 1.0 committed commands. dvb-sat.c has not changed since
 "dvb-sat: Use the right values for LNB setting" (2017-11-16), so this
 should still apply to current master; the patch is against master.

 Frontend ioctls logged with an LD_PRELOAD wrapper, dvbv5-scan -S 2,
 Hot Bird 11727 V (high band), before the patch:

   FE_SET_VOLTAGE 13V
   FE_SET_TONE    OFF
   FE_DISEQC_SEND_MASTER_CMD e0 10 38 f9
   FE_SET_TONE    OFF

 With -S 3 horizontal transponders (e0 10 38 fe/ff) also stay at 13 V.
 The result is that "11727 V" locks the low band transponder at the
 same IF (SNRT, really on 10873 V). MythTV on the same hardware sets
 voltage/tone itself after the same committed command and works.

 The same can be seen without any wrapper using
 strace -e trace=ioctl dvbv5-scan -S 2 ...: FE_SET_TONE is called
 with SEC_TONE_OFF (1) after the DiSEqC command also for high band
 transponders. I can share the LD_PRELOAD logger if useful.

 Tested with the patch applied on top of master, without any workaround:
 - port 2: f8 13V/off, fa 18V/off, f9 13V/on, fb 18V/on; all four
   quadrants lock (Hot Bird)
 - port 0: unchanged (f0/f1/f2/f3 as before); all four quadrants lock
   (Thor)

 SCR/Unicable (t != 0) is not tested; the patch keeps the previous
 behaviour for that path.

 --- a/lib/libdvbv5/dvb-sat.c
 +++ b/lib/libdvbv5/dvb-sat.c
 @@ -540,8 +540,12 @@
  		if (parms->p.current_sys == SYS_ISDBS)
  			vol_high = 1;
  	} else {
 -		/* Adjust voltage/tone accordingly */
 -		if (sat_number < 2) {
 +		/*
 +		 * Adjust voltage/tone accordingly. This is independent of the
 +		 * satellite number: committed multiswitches select the quadrant
 +		 * from voltage/tone. Only SCR/Unicable (t != 0) must not do this.
 +		 */
 +		if (!t) {
  			vol_high = pol_v ? 0 : 1;
  			tone_on = high_band;
  		}

