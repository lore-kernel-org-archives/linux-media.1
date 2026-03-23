Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C105387357
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 09:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259758; cv=none; b=JeN6fDfzrZCYcgVA3lT0NC002Tpu6bw/9g0uujmcfzHabJGPT17ZuCOZf6+suMpEeGP9VKQzuLMLsgLuREkTh1SJKWoMlMToYdn6npmPauLFNkDaeaT3pTm4jdX2NAtoqDXv2uzUgIOcgSJv2oqolTw8ljt+gvD1ydsjNp2pkH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259758; c=relaxed/simple;
	bh=wRHBaUZmtCdvCMwDSslO0TmvYIoFeraV2jmLg4lMg1o=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=cK07M9xydU+tbQbNQ4zfPjPV5KNER2mF0LQPQWRdgB0NadTeNt3muHfsZHRcA9g48/LO9SCN1U5oNLyQqBEon+LyR04lZ1ny6jeTqa1lJffwN0r1kT0Fk+kW687SqSvuMlkXBdIBYcjYPpD29vzk1GH8RHSYPleNKLnyVlFFqnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BKKINU+k; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BKKINU+k"
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B589874;
	Mon, 23 Mar 2026 10:54:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774259679;
	bh=wRHBaUZmtCdvCMwDSslO0TmvYIoFeraV2jmLg4lMg1o=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=BKKINU+km/1v8vzi5UbSb3xBwAOzGaToDIBEdIuprVWPr32WZz7C1PFuriWjqS2lc
	 VZ1irG3y71v8fBBofzQMOIL3Taf5X2c5gyoIxQFqbAGfblBXPnB8DpiccUb5vXcF1V
	 pdvUeku/h3iDMZ+KuO61Z+AeHi2kJD/BX7NuaeZY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <AMBP190MB2678E7DC048409068260DCE8ED4AA@AMBP190MB2678.EURP190.PROD.OUTLOOK.COM>
References: <AMBP190MB2678E7DC048409068260DCE8ED4AA@AMBP190MB2678.EURP190.PROD.OUTLOOK.COM>
Subject: Re: REGRESSION: ipu3-imgu: commit a66191c590b3b58eaff05d2277971f854772bd5b breaks camera functionality on Surface Go 2
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Michael Anthony <manthony.nw@outlook.com>
Date: Mon, 23 Mar 2026 09:55:52 +0000
Message-ID: <177425975200.3376561.11999798013858190771@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Hi Michael,

Quoting Michael Anthony (2026-03-22 15:40:37)
> Hello,
>=20
> I am reporting a regression in the IPU3-IMGU driver introduced in the 6.1=
9 kernel cycle.
>=20
> Regression Description:
> Following the upgrade from kernel 6.18 to 6.19 on Fedora Linux, the IPU3 =
camera on my [Device Model, e.g., Surface Go 2] has stopped functioning. Wh=
ile the modules (ipu3_cio2, ipu3_imgu) load, user-space tools like libcamer=
a can no longer initialize the device.
>=20
> Suspected Commit:
> "media: ipu3-imgu: Drop struct imgu_device v4l2_file_ops field"
> Commit: a66191c590b3b58eaff05d2277971f854772bd5b
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
commit/?id=3Da66191c590b3b58eaff05d2277971f854772bd5b
>=20

I tried following this link - but it's apparently not the commit you
expect. Can you identify which commit you actually bisected to please?

--
Kieran


> Impact:
> This change seems to have removed a field that libcamera or the V4L2 sub-=
device internal routing relies upon for this specific hardware. Reverting t=
o the 6.18 kernel restores full functionality.
>=20
> System Information:
>=20
> Distribution: Fedora 43
>=20
> Kernel version: 6.19.x (Broken) / 6.18.x (Working)
>=20
> I can provide dmesg logs if required. Please let me know if you need a fu=
ll media-ctl topology output from the working vs. non-working kernels.
>=20
> Best regards,
>=20
> Michael Anthony
>
