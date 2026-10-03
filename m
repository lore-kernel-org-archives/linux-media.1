Received: from mail-pz2-f7.google.com (mail-pz2-f7.google.com [74.125.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C336A37B3F7
	for <linux-media@vger.kernel.org>; Sat,  3 Oct 2026 10:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021878; cv=none; b=TVsmpx12zmQS9gsoudtwvB6e3qjz57v8wAdTc4Id60vVU9KuK0TyjXpl/YEzFJLYgGUij9zJgiPyj7pD/doD8joAOCKSF6TtxeqhBnHzeMOOrJs4RwLnx2q5ir23TQzPv8hiF+43iM/BC9nowItf/i0n+9rbpPOpfAArkr02RyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021878; c=relaxed/simple;
	bh=O4fhyAKEtLoyIjrYd1doUUUlI2ZyKNVlzH5Eu6cpoZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lyEIsrRmWdiBsTmxbUOoH3LjnfagSABilRArnFcnFgrq71VzNx80l+SzBFSyJ5Db7RQFyG1hlxdmAzPrjsuBjuYr3BVghe1mtYOr1Ql88vxXaT0cEPmiojJCPKbJdj4tIii9K99TOKEtlqdfBE2Ta74ZXEz8uV9a4FGqo6D184E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mP5aWTLn; arc=none smtp.client-ip=74.125.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mP5aWTLn"
Received: by mail-pz2-f7.google.com with SMTP id 41be03b00d2f7-cc4ae08cca6so18674a12.0
        for <linux-media@vger.kernel.org>; Sat, 03 Oct 2026 03:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791021876; x=1791626676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IHYEahD+HEjWATdVIsFuXWmcHH7Pn8DgotCON/mJvLc=;
        b=mP5aWTLnUR4giJM0Wv+HQ7BDprXNG94S/a7TP4df6Ec8WVyp9GUIpGtgoAnev18yKL
         CxRLIO6PfLMhDMRZDEsB4WwBNnrYRIbs5TUJ3oE/6clu8IqGxqM3vInJ0aQUi8UwYOUy
         uq0zzijuUJOTk4LjTreBroCMX6a+IKLrLrYawIreVhwLrGRBjdNO8GPtXz2hOfUKZxGD
         nFnmtjDdEJoo1R4VUHEHTon6TEjyLC3Bsvc6oCBxYyuYnRLBXU/DswcPaZtpf4cz+6Qd
         xubFuHv7O9u/PDDSn/afKff+Kkfpp6Rrr2bshC0V7shtGU8DCBMUvLfCbo4V2mnXAxDK
         afZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791021876; x=1791626676;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IHYEahD+HEjWATdVIsFuXWmcHH7Pn8DgotCON/mJvLc=;
        b=xTCBAV0b6gJjBYg19y8s12Io6/aFJLFcZmvNjiFEwg+Rtk57+AAcigjkGecV42Ii7Z
         QTzu/NqSq3u8dT36RCVwKNE6aKB0Ovc8pdbQgMrYQZamRPtRkhMaGzC51aCGQoy1qXaN
         XxFtlOvZGc2HENfTc7ayx/9JdXlIz/6rIVHWuVV3JczMo9xPDUseqSepiuwwLSyHP6i9
         j+jeKlymx+4sEu+U/mfzkY0xKbnIxli6AvyVv6bO9Mi2heZPPIgZLe6YjhEmyVkzu9hV
         hsPS4zA+GBXPkQ57XAMcH0Q6ycrCrhOPVfkiokEC6ATAw0tN+wycm/D4jEitewEiSs/P
         TaQg==
X-Forwarded-Encrypted: i=1; AKwUvBzklqkr58C1SHDPsjIbTzX5i5MKDuIIvRCzyDZuxBInwsBkHAXJKH5AUqMx16or8RLmTDZTJczP+WdLEA==@vger.kernel.org
X-Gm-Message-State: AFuF++l9qQxRGBQ14eMiiujG3QDZDdChb4aug4HyQ00xGxVkGociSIJZ
	gtieNRmiNcHVSgQq24OZ8nmE8t0RHpc2wMwphyq6hGsSzqmz/08TzdlG
X-Gm-Gg: AYBFou1NkAbcezlRDq9nE662dsRyGZf4in0WFgSFXnPxlG6Uok2VdNErnrsFOBUwImd
	8QhylVN+Wx7LbpCtX/DO26YoIPw1Vpej5LJkdsfbETLAqz9YGGPgIwzooPZOaqeikxR2dFHlfaE
	r7iVjn3HXCW8cQPrMg0l2Lu9vyxJYj+npuolS2wveZ+ejPZoJrZYsGb1d4elxg3eMexCbLpX8JU
	AhvdTFSnWqi7YjIItIBxwV4GOeLld4ugfA5yayua7G16etYyxBTrNjdAf/oED2lz+IvceMe5tBs
	XkywQzRmZUpE2SzOtt6OXMrb0e9V8/Gy7sPdVFzfsl+c+QZULAWI/8C+BkZwiSV3f9G3e3S6p1L
	NxtbIw5CUdndHqYGME17yDb5cRckFf3z8mriUIqh2MIrIGE8gKTbn/L3aKd1j3ib4dvju5mf6Rw
	2sBKdkBV3EvfmKwfEVRTrk4/WF+Odqino0rr7vdDHfdihc6PlR6v5M/gYFF9zmajR71PZNNHtWs
	ps=
X-Received: by 2002:a05:6a00:b50:b0:874:708d:b62f with SMTP id d2e1a72fcca58-88c628f240bmr1630063b3a.27.1791021875942;
        Sat, 03 Oct 2026 03:04:35 -0700 (PDT)
Received: from ThinkPad ([240e:46d:7b20:7df:1ddc:2f29:f17a:97e4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88caf6b0bfdsm376019b3a.29.2026.10.03.03.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 03:04:35 -0700 (PDT)
Date: Sat, 3 Oct 2026 18:04:05 +0800
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Ruslan Koreev <koreev.r@gmail.com>
Cc: sakari.ailus@linux.intel.com, benjamin.mugnier@foss.st.com, 
	sylvain.petinot@foss.st.com, dan.scally@ideasonboard.com, mchehab@kernel.org, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux-media@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Marshall <pm@petermarshall.ca>
Subject: Re: [PATCH v2 0/4] Lenovo ThinkPad X1 Carbon Gen 14 IR camera: ST
 VD55G1 on Intel IPU7
Message-ID: <asDSmOu2NMD_SFnr@ThinkPad>
References: <20260929092700.1776966-1-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929092700.1776966-1-koreev.r@gmail.com>

Hi Ruslan,

I did some more testing and checked the saved logs from my original
next-20260928 tests. The VD55G1 failure appears to be intermittent.

Today I managed to boot the original next-20260928 + v1 patches 1-3
kernel into a state where the VD55G1 probed successfully again.
`cam -l` showed both cameras:

  1: Internal front camera (\_SB_.LNK0)
  2: Internal front camera (\_SB_.LNK1)

I then ran the libcamera test you provided:

  timeout 30 cam -c '\_SB_.LNK1' -C5 -s width=804,height=704

The camera was configured as 804x704 R8, but when capture started the
same I2C failure appeared:

  i2c_designware i2c_designware.1:
    i2c_dw_handle_tx_abort: lost arbitration
  i2c_designware i2c_designware.1: controller timed out
  vd55g1 i2c-TBE20A1:00: Sensor reset failed -110

The IPU6 ISYS path then reported stream stop/close timeouts and failed
to start Intel IPU6 CSI2 2 with -110.

I also checked my saved logs from the original testing. They contain
both successful and failed boots of the same kernel build and command
line.

In successful boots, the media graph contained:

  vd55g1 1-0010
    -> Intel IPU6 CSI2 2
    -> Intel IPU6 ISYS Capture 16
    -> /dev/video16

and /dev/video16 advertised GREY, Y10 and Y10P.

In failed boots, the sensor failed during probe with the same sequence:

  i2c_designware i2c_designware.1:
    i2c_dw_handle_tx_abort: lost arbitration
  i2c_designware i2c_designware.1: controller timed out
  vd55g1 i2c-TBE20A1:00: Sensor reset failed -110
  vd55g1 i2c-TBE20A1:00:
    probe with driver vd55g1 failed with error -110

This seems to explain my earlier results: sometimes the I2C failure
happens during probe, so LNK1 never appears; sometimes probe succeeds
and the media graph is created, but the same failure can occur later
when streaming starts.

I checked the basic sensor power sequence during failing probes:

  - INT3472:01-vana is enabled during probe
  - the active-low VD55G1 reset GPIO is deasserted
  - INT3472:01-clk is prepared/enabled at 19.2 MHz

The "Sensor reset failed" message above is reached while
vd55g1_wait_state() is polling the sensor over I2C after reset has
already been deasserted.

I also tried forcing i2c_designware.1 runtime PM to "on". In another
test I prevented vd55g1 from probing at boot, waited until the system
had been up for more than 10 seconds, and then loaded the module
manually. Neither changed the failure.

I rebuilt the saved next-20260928 + v1 patches 1-3 source tree and can
reproduce the problem there. I also see the same probe failure on
next-20261002 with the v2 changes already present in linux-next. So at
this point this does not look like a v1/v2 or
next-20260928/next-20261002 regression.

For completeness, I also ran into a separate intermittent boot hang in
thinkpad_acpi hotkey polling while doing these tests. Disabling
CONFIG_THINKPAD_ACPI_HOTKEY_POLL makes boot reliable, but does not fix
the VD55G1 I2C failure, so I currently believe the two issues are
unrelated.

Have you seen this intermittent arbitration loss on your X1 Carbon Gen
14, either during probe or when starting the VD55G1 stream? Is there
anything about the BIOS/firmware or I2C setup on your test machine that
would be useful for me to compare?

I have complete kernel logs from successful-probe, failed-probe, and
successful-probe/failed-stream boots, as well as the saved media
topology, if useful.

Thanks,
Qiling Zhu
