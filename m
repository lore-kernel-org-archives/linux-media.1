Received: from mail-24420.protonmail.ch (mail-24420.protonmail.ch [109.224.244.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386F4499F20
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 18:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788287969; cv=none; b=LcRhd648xDKHni6eUDCtrPEVnKoC0VyIRJxYLFs/tLYF50AvOr2SegMDbEvpSWpG6dtGK/d97cEG+T/k4WY/gF0PVrp3McNTwI5rFJctD3rnogGghBRT2g3z6tlhs5tfl7EikAgueDokro8W5E735Lp/fkIEu0pwxIYGEryQAp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788287969; c=relaxed/simple;
	bh=xF7FYtj+iHvvL3BU71gN0djIQV6EH5EQZt/eACU357w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pic5MPhywbD+gFZNkyAaGN1yRQtd0rFSAKKqDAu4AFRo3HsAGzvdwvLcaLejwGsJE0lIt6we6NPTX3T3jgIvMwvgElLLKDhJ4pjJwYS0oVbtsN48JLMgHDAaihRwJb2D4ubCO124UEMStXPfUFmzWR33o3w3AgGmLrPd34xBfT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=berg.pm; spf=pass smtp.mailfrom=berg.pm; dkim=pass (2048-bit key) header.d=berg.pm header.i=@berg.pm header.b=tLkHv+n9; arc=none smtp.client-ip=109.224.244.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=berg.pm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berg.pm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berg.pm header.i=@berg.pm header.b="tLkHv+n9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=berg.pm;
	s=protonmail; t=1788287957; x=1788547157;
	bh=xF7FYtj+iHvvL3BU71gN0djIQV6EH5EQZt/eACU357w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=tLkHv+n9X5z3rpPK11hCgbyoOZwU7fDQ06ZE9EECHEgRvhAKxrupRnVGsaLG1auk9
	 zHn9xKHxyWSqM/34KZBA1VRPL1knbyOYaOkFbxpVsPJruVTymS8cHp+Fk8h7wFiKcp
	 Iv4w3N/Q6NRh1iF9YlyGKzoC/YBVbR/tOQCGq3e8EpAejZuRLNRP+BgqAHokZYWPTQ
	 uhZ4zqafonSIMXko0wpxRjsig3NxDl/4r01E4hEtZATcTPKxPftEQHuKHDUHtEt9Zc
	 L8uLadM4gzqkVaODAqlhlMLnIcV3YKtT69m4OnSQn2By3+kOfgq6R1OFwskTOSrBQa
	 4/Lf0h9fg99Sw==
Date: Tue, 01 Sep 2026 18:32:28 +0000
To: Fernando Rimoli <fernandorimoli11@gmail.com>
From: Jakob Berg Jespersen <dev@berg.pm>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, dan.scally@ideasonboard.com
Subject: Re: [PATCH v4 3/6] media: i2c: ov5693: Gate the MIPI clock lane for non-continuous clock
Message-ID: <DroMyWf-5WJnXXsMNC0RcPfFHRkEggXfJl94jJlLPiykIf02dD31M7n9_JJ57WvvsXpxZsLJ5upjDgrEGgFzCeaMMUSihX3GjAGL0GClZ0I=@berg.pm>
In-Reply-To: <20260901163417.230456-1-fernandorimoli11@gmail.com>
References: <20260720163819.104130-1-fernandorimoli11@gmail.com> <20260831181858.325109-1-fernandorimoli11@gmail.com> <20260831181858.325109-4-fernandorimoli11@gmail.com> <zDaw-AawkcNfIRsmWXbsPx2WDcg6ltaiPc7FZZTNp7DH-ACLsF98A3QDuuhX4iejr2-VLQYf48c1cingAI4i58i4t2dD4t45SfHr5d4MeOM=@berg.pm> <20260901163417.230456-1-fernandorimoli11@gmail.com>
Feedback-ID: 210104851:user:proton
X-Pm-Message-ID: 2a0dbf08900bc3428936af5a7c7c7f1cdc358e90
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Fernando,

For the front camera, ov5693: all 20 were inside a single boot, uptime 6
minutes at the start and 19 at the end. No reboot and no deliberate
power cycle anywhere in the run.

The part that bears on your question is which runs worked. It was runs
1, 7 and 14, not the first few. So on this machine it is not "works once
per boot" - runs 7 and 14 came well into the same boot, after several
failures each. I would expect a rerun to give a somewhat different
count.

Each run was an independent open and close of the camera rather than one
long capture, and the sensor runtime-suspends in between: on the patched
arm an i2c read a few seconds after a capture had finished returned
Remote I/O error, because the sensor had already powered down. So if the
behavior were once per sensor power cycle, I would have expected close
to 20 of 20 rather than 3.

For whatever it adds, I measured 1 of 20 on this machine in July, on
7.0.12. And last year, before I started developing on this, I made a few
comments on the randomness of the (unpatched) front camera on Fedora 42
and 43:
https://github.com/linux-surface/linux-surface/discussions/1354#discussionc=
omment-12863982

On the confound you mention: during my 20 runs the IR camera was not
merely idle, it was absent. ov7251 failed to probe with -121 on that
kernel, and libcamera enumerated two cameras, front and back only. So
nothing was streaming on a neighbouring port while I measured. For what
it adds, on the Pro 7+ the front camera sits on csi2-4 and the IR camera
on csi2-5, and those two share a D-PHY - so the Pro 8 user's suspicion
looks mechanically plausible on hardware laid out this way, though I
cannot say his mapping is the same.

Two details that may help you separate the machines. The ov5693 sensor
is genuinely up during the failures - the privacy LED lights - so it is
not a rail or a probe problem. And the successful runs log 10 to 11 csi2
errors while the failing runs log none at all, so the failure looks like
the receiver never locking rather than the sensor never starting.

Regards,
Jakob
