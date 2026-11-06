Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.92.124.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994201;
	b=pDlCzcxnQAqEIgEzb9YePsz3iizoolk4Kld7X6zwBBZ2PA6QRd607Z1hilR/Jmyn0d/7
	 Z4RmvAA0Amg0LxxC5VgGdsHTUooT4ks99hxdO0LT7dga/Ec8HO31cAG5LksyFbJsZuVBg
	 duriQySll2McCSR5pAZx0n43+mXSqeA9ptsouXGhciirA9p/vQLMKrapSDj1hBNEbd66j
	 8FIi7PA0gRwxpFkStHtLWo5b5q+yKfNb0LdeJuDJ/z+0H2eJ4kGf5l04v8FanSsHlFN4R
	 9n9YYOBNhkJiIJVJrQRZ4goDICqPps5rDV+igryTHy3ELlQNaoDm80KPbd5UZXOogbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994201;
	h=DMARC-Filter:X-mail-filterd:Received:X-mail-filterd:X-lpn-mailing:
	 X-lpn-spamrating:X-lpn-spamlevel:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 DKIM-Signature;
	bh=hN/NHAY6mGKS8bjJoc5hqizE+odACcbb+5+aa+JqYE4=;
	b=DlJkjPBvpPDdWzxxGbp23RNOMku561qK3mpJ92aLNrqXqvCzFv7wTCHcE8Wq0rcPUnL5
	 VMgQCW3qYa4ZrllAFl4sokWLNs4kxXG1ACAsTZBMmnlc2wCBEax1yDntyvrAEC9uj3fbW
	 tj9BCbijpsY7u+9YiKsRac93OuU3u5kY+KMNSDYU4EU/BS0T9L9MjsOEMGwum4uNKokh3
	 Bl1hWx7X9LhajjwM4f1M/W+dIpPfU0gLnGLK7m8dp0VamPlhb7Hoke6tslE6oS5nKdry5
	 KCgx/adUdCfWtuSh+nTeSLH/UHC4ZYYrPJ798Uw+zA3sZAloSAHeHZBWcX7MP8jhsPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=laposte.net;
	spf=pass smtp.mailfrom=laposte.net;
	dkim=pass header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256 header.s=lpn-wlmd header.b=lKB73I5L;
	arc=none smtp.remote-ip=160.92.124.107
Received: from smtp-outgoing-1903.laposte.net (smtp-outgoing-1903.laposte.net [160.92.124.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605B1606A326
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 19:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 605B1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laposte.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256 header.s=lpn-wlmd header.b=lKB73I5L
X-mail-filterd: {"version":"1.9.7","queueID":"4jLqNB5x4Zz1qqhq","contextId":
 "e420a065-3b56-4a61-85b7-347ef073f7a7"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
	by mlpnf0119.laposte.net (SMTP Server) with ESMTP id 4jLqNB5x4Zz1qqhq;
	Fri,  6 Nov 2026 20:43:06 +0100 (CET)
X-mail-filterd: {"version":"1.9.7","queueID":"4jLqNB1crBz1qqhn","contextId":
 "fbf6046d-009c-4dc4-94a1-a15aa1984c7f"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from [192.168.1.2] (m-dj.hd.free.fr [82.67.82.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mlpnf0119.laposte.net (SMTP Server) with ESMTPSA id 4jLqNB1crBz1qqhn;
	Fri,  6 Nov 2026 20:43:06 +0100 (CET)
Message-ID: <169ccc0e-d513-4ae4-9a46-cb11be7d1178@laposte.net>
Date: Fri, 6 Nov 2026 20:43:05 +0100
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
Subject: Re: libcamera: pipeline: simple: Disable packed mono for VGA sensors
 on Intel IPU6/IPU7
To: Fernando Rimoli <fernandorimoli11@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Milan Zamazal <mzamazal@redhat.com>, Sakari Ailus <sakari.ailus@iki.fi>,
 Robert Mader <robert.mader@collabora.com>,
 libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org
References: <c218b8a2-9e69-4ef3-b36c-7df7e7637d4d@laposte.net>
 <3a98bb5e-a4c4-40b7-ad4d-1b251c03b4ff@oss.qualcomm.com>
 <20261101164311.GA3368923@killaraus.ideasonboard.com>
 <304e2a5a-f8d8-427d-84f5-b6f4498452df@laposte.net>
 <20261101195019.220940-1-fernandorimoli11@gmail.com>
 <6cfa9260-b48d-484e-9c88-b75feb0392f9@laposte.net>
 <20261105004652.147540-1-fernandorimoli11@gmail.com>
 <5bb49b41-368c-4889-9f56-9a477e85694f@laposte.net>
 <20261106163039.18237-1-fernandorimoli11@gmail.com>
Content-Language: fr
From: Alain Cousinie <alain.cousinie@laposte.net>
In-Reply-To: <20261106163039.18237-1-fernandorimoli11@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=laposte.net; s=lpn-wlmd; t=1793994191; bh=hN/NHAY6mGKS8bjJoc5hqizE+odACcbb+5+aa+JqYE4=; h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:Content-Transfer-Encoding; b=lKB73I5LWFm1JgotRHwaN3X34an2TCowWsm+20u4PlaLHjvbxMpwoQzojjKWo02QV8zBRXve4kMykOS0kdNVG7As1pm4WiHRVb+Re4J/PV+82GB62Hn7tm1OIQ3xXCFdzT2KUZliOYi8nMu5bZGtV+d3HhzJQHIhnzCUuVtt+3I1fPiPWMarbpj67tfiWAdtE9gg6m3earpCI+2uYLCWdSvtvySSkpXQR2Uf7FfDCl42JqKNnh3WoOKKh4EEm7RCccUBRCHbYl/9FFYgVBHyrFnE9G10k4tqxVLLNxJuhlhll7k41NSoxD6JliI9ljfKZCe65dTU1lvl0xuuBb5XBg==;

Le 06/11/2026 =C3=A0 17:30, Fernando Rimoli a =C3=A9crit=C2=A0:
=20
> Thanks for the retest. It rules out the rate and link frequency, but
> not the stride: on Alder Lake the same 800-byte lines with an 832-byte
> stride stream and stop cleanly. Packed VGA stalls on your Meteor Lake
> and works on Alder Lake, which points at the MTL ISYS driver or
> firmware, as Sakari suggested.
>=20
>> it validates your recent patch proposal to disable packed mono for VGA=
 sensors on this platform.
>=20
> I haven't proposed that. I argued against a libcamera rule, as it would
> also drop formats that work, and I agree with Laurent and Sakari that
> the fix belongs in the kernel.

Hi Fernando,

First, please accept my apologies. I completely misinterpreted your comme=
nt and thought you were proposing to disable packed mono for VGA; thank y=
ou for correcting me.The fact that the 832-byte stride streams cleanly on=
 Alder Lake but stalls=20
on Meteor Lake definitely narrows it down to a MTL ISYS driver or firmwar=
e bug, just as Sakari suggested.

Has a formal bug ticket already been opened for this regression with the =
Intel IPU6/ISYS team,=20
or should I open one myself? If so, please let me know the preferred trac=
ker.
Since my setup is fully operational and the issue is 100% reproducible on=
 my hardware,=20
I would be more than happy to test any experimental kernel patches or fir=
mware updates
the team or Intel can provide to help fix this.

Best regards,
Alain
