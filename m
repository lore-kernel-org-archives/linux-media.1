Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.92.124.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793601124;
	b=c46nJn7gVIOMV7AzdvhB2U37IrA8Ns+SEhkiM57WrjPo1BOUU+a9ObpZK7krF/9peJwV
	 F2k6JVJh43BZ1w3H7GtpyH4G7KWiaKamo6KR4P8Q+9K8nrplxK0fq+kpwn+Yj6fWAf/BV
	 R0w5/C0E8Z+2CaMzD9aAZ02PmABHhx+ooOtcPOgH+3hJ4ERTBGDVyTvvoSwm2PqN4neY7
	 Qrj+i4mP4t+PXIqswUUH5tpMUJ6RsBIcfjUSFPPE5XhvscwGZ/CrNx2LA5cFMShJjSI5i
	 hPUCV1jzgnYRfdqev1hDk2oGK8TNZhL9Ig+LcpBC7dew2NH9pp142oLTcqD/n2TXv6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793601124;
	h=DMARC-Filter:X-mail-filterd:Received:X-mail-filterd:X-lpn-mailing:
	 X-lpn-spamrating:X-lpn-spamlevel:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 DKIM-Signature;
	bh=zS5l7jOfx+wJm0xPaDKEiritGL1YwK9e93UHJo5zc6g=;
	b=1MPntP8uSeKzzB5V6Gq4zWzC3C7SSwRvSv5gz+vXaIhxWEJVrUyhv7jlji4vbRvJjflA
	 BePybhVAtxuuk2+/nehi/0FrYUzFKTIh2nUyK94mEfc24mfCEYDYtACJrgBnVkzi9zz8m
	 atOiymu8ZQnkN4kONo2gL8R25cCLJ6Y0SqaRnGOIABaOvKDqauWZDzLkN+9zmudfLHM/C
	 defayhQIbXcadnIlohKzT6Adbs9AwgZ3tZKP6LQHzcAGvvdMc+uW6FbJcPDoKokFWcfMI
	 VLig4+gcmSMVvLU/4ua9ocSqQtBVNNkizjKOmA4WJlMbQqK8xbcSjbsbCruAwoGnRUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=laposte.net;
	spf=pass smtp.mailfrom=laposte.net;
	dkim=pass header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256 header.s=lpn-wlmd header.b=rqCPsXE0;
	arc=none smtp.remote-ip=160.92.124.103
Received: from smtp-outgoing-1802.laposte.net (smtp-outgoing-1802.laposte.net [160.92.124.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD626606A324
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 06:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD626606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laposte.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256 header.s=lpn-wlmd header.b=rqCPsXE0
X-mail-filterd: {"version":"1.9.7","queueID":"4jJ20y4rMMzWf0T","contextId":
 "87465898-de37-487f-a3d9-c28f139d78d1"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
	by mlpnf0107.laposte.net (SMTP Server) with ESMTP id 4jJ20y4rMMzWf0T;
	Mon,  2 Nov 2026 07:31:46 +0100 (CET)
X-mail-filterd: {"version":"1.9.7","queueID":"4jJ20y0xBZzWf0M","contextId":
 "799da636-4d40-4d02-82de-de679cf02357"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from [192.168.1.2] (m-dj.hd.free.fr [82.67.82.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mlpnf0107.laposte.net (SMTP Server) with ESMTPSA id 4jJ20y0xBZzWf0M;
	Mon,  2 Nov 2026 07:31:46 +0100 (CET)
Message-ID: <6cfa9260-b48d-484e-9c88-b75feb0392f9@laposte.net>
Date: Mon, 2 Nov 2026 07:31:45 +0100
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
 libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org
References: <c218b8a2-9e69-4ef3-b36c-7df7e7637d4d@laposte.net>
 <3a98bb5e-a4c4-40b7-ad4d-1b251c03b4ff@oss.qualcomm.com>
 <20261101164311.GA3368923@killaraus.ideasonboard.com>
 <304e2a5a-f8d8-427d-84f5-b6f4498452df@laposte.net>
 <20261101195019.220940-1-fernandorimoli11@gmail.com>
Content-Language: fr
From: Alain Cousinie <alain.cousinie@laposte.net>
In-Reply-To: <20261101195019.220940-1-fernandorimoli11@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=laposte.net; s=lpn-wlmd; t=1793601115; bh=zS5l7jOfx+wJm0xPaDKEiritGL1YwK9e93UHJo5zc6g=; h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:Content-Transfer-Encoding; b=rqCPsXE0kAKLUdUkVaoAHJ0rJ8eKI+xp93QwscZ4cQ6qRfmABFSZtXAYxbKlx6dJx0zxhpeE5aO+gN4KGzuJdQCW9ZdLHulG6mefGzKFxilKTtd9oysc14PzFlKctdKacRemw4eBi3rNWMGEsrf9KPxiqc3OY4B3T6QwFf5wE9F/XL0C7oKvyVa7qmsqhjxq3r472xf40Vo+9ZkSg2GPpEohWI96/wqqJjNNI16OnHnSGJs4i66JH6iTBdu2c7g+vMlnRLtKRCulLRnWO3UOSNQQxk9QXh7hsu0pDbfy10JP/uHBLy9jTdBo2QvEIupY3uULMQQULhTnroAWsNVKUA==;

Le 01/11/2026 =C3=A0 20:50, Fernando Rimoli a =C3=A9crit=C2=A0:
> Hi Alain,
>=20
>> Forcing packed monochrome (`CSI2P`) on VGA sensors (640x480)
>> triggers a systematic `stream stop time out` on Intel IPU6/IPU7.
>=20
> Not on every IPU6. On a Surface Pro 9 (Alder Lake, IPU6 8086:465d, 6.19
> kernel) its VD55G0 infrared sensor streams 640x480 R10_CSI2P (800-byte
> lines, 832-byte stride) at full rate and stops cleanly: 120 of 120
> frames, then five start/stop cycles of 30, with nothing in the kernel
> log. R8 and R10 at 640x480 behave the same.
>=20
> What does fail here is narrower lines. With Sergey Lebedev's vd55g0
> driver, which offers 320x240, R8 (320-byte lines) delivers about a thir=
d
> of the frames, while R10_CSI2P (400 bytes, 448-byte stride) and R10 run
> at full rate. So the limit depends on the platform and the line length,
> and a libcamera rule dropping packed formats at VGA on all IPU6 and IPU=
7
> would also remove ones that work.
>=20
> Which IPU (PCI id) and sensor does your Spectre have?
>=20
> Fernando

Hi Fernando,

Thanks for your reply.

I am using an HP Spectre with an Intel i7-155H processor.=20
The camera relies on IPU6 and uses the `og0va1b` sensor,=20
which was added in kernel version v7.4-rc1.
I modified the driver to include the ACPI entry `IPU_SENSOR_CONFIG("OVTI0=
0AB", 1, 500000000)`=20
and adjusted the frame rate to 240 fps for a 640x480 resolution.=20
Currently, the driver is configured for the R10 unpacked format at 60 fps=
,=20
whereas the sensor natively supports R10 packed at 240 fps for this resol=
ution.

It works in the unpacked mode; however, I attempted to add the packed for=
mats=20
to the Linux kernel and verified the configuration within `ipu6-isys`,=20
but it did not work=E2=80=94resulting in timeout errors.

Best regards,
Alain
