Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED96A3914FE
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 23:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789429100; cv=none; b=HbQLRxK2pbPw+fGN3PnSARgU8J+6xBAMtk576huwGPOjLtXOV5z3J1hXRhegm+Y+Bu3KFrnGn2DIiKpnP8ZvW8mP48I52ZFSQ6Ou0o/6eOvNkJ4l5f64p9qOPzkYX/4177giHRhoFI3jtJgL/7AkDjGyMgbH0GOztF8U7DlgHKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789429100; c=relaxed/simple;
	bh=X3iwKqYK+nev/dRriMLB36mx0LIaX52EphA25Ii3yrk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DNjOOyl5+oHPHUxpSXwJbGaG7/1yZCqxDU3W6ZbiE8WyDm5ynTtyvTJOAwIF5EEHRB2BgMs8m5MxbkPJwTPjr422UJlmV5fyZtaa7JLTURrUffEpY//e9rkVB9hL2mSPyT2LiQj2KCT29eAZ20mqtcEPm0L9r2vTF73xVRd+3wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mhfB5lh5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mhfB5lh5"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 453BB2EC;
	Tue, 15 Sep 2026 01:36:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789428991;
	bh=X3iwKqYK+nev/dRriMLB36mx0LIaX52EphA25Ii3yrk=;
	h=Date:From:To:Subject:From;
	b=mhfB5lh5TpkoAsELeQX/765OS6H49TL2UBYmFj7x4jOOksXfw3+Og5SGMMk2wn6ie
	 OWiF14hnUDXbIDES22QRYBWSEE9c4y5uR9fdGoDkLnbPUFeVmlEbhxI1pCy9ErJQDw
	 YisO/RNLUrBcnS0VLDhKIxEQ4DhlVe68mWDrhqZs=
Date: Tue, 15 Sep 2026 02:38:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org
Subject: [ANNOUNCEMENT] Camera & ISP at Linux Plumbers Conference
Message-ID: <20260914233810.GA2796257@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello,

As most of you already know, the Linux Plumbers Conference will host a
Camera & ISP BoF in Prague in three weeks ([1]).

The initial proposal for a microconference has unfortunately been
downgraded by the program committee to a 45 minutes BoF. We have
therefore decided to limit the discussion to three topics at most. Two
topics have been approved so far:

- RGB-IR support in V4L2 and libcamera

  by Rishikesh Donadkar and Devarsh Thakkar, Texas Instruments

  The Linux kernel V4L2 API does not support RGB-IR image sensors.
  While building blocks necessary to handle those devices are slowly
  being merged, RGB-IR support itself hasn't been tackled yet.

  Rishikesh and Devarsh will also present this topic at the OSS Europe
  conference ([2]).

- Camera module identification

  by Stefan Klug, Ideas on Board

  Camera tuning and calibration depend not only on the image sensor, but
  also on the lens and other characteristics of camera modules. While
  Linux supports identifying image sensors, it completely lacks the
  concept of camera modules. 

  Identification of camera modules requires coordination between
  platform firmware (DT or ACPI), the kernel and userspace. Discussions
  will benefit from the presence of DT maintainers.

We can consider scheduling a third topic. Proposals are welcome.

Due to the 45 minutes BoF format, we will focus on discussions and won't
be able to afford presentations. All topic leads are expected to
circulate discussion materials on public mailing lists at least a week
before the event to give attendees time to read through proposals. The
materials should summarize the issue at hand and the ongoing work, and
clearly state the questions that will be discussed during the BoF.
Slides that support the discussions, if any, should also be submitted
prior to the event.

If there is enough interest, I am considering booking a meeting room on
Wednesday morning (location to be determined, likely outside of the LPC
venue) to extend the BoF. We could continue discussions on the topics
listed above, as well as schedule additional topics. We would overlap
with the following LPC microconferences:

- Networking Track
- Containers and checkpoint/restore MC
- Rust MC
- Scheduler and Real-Time MC
- Build Systems MC

Please let me know if you would be interested in attending a Wednesday
morning session by replying to this e-mail (publicly or privately). If
you would like to propose additional topics, please do so publicly.


[1] https://lpc.events/event/20/contributions/2364/
[2] https://osselceu2026.sched.com/event/2RaZj/enabling-multi-stream-camera-sensors-in-linux-rgb+ir-streams-and-embedded-metadata-rishikesh-donadkar-devarsh-thakkar-texas-instruments

-- 
Regards,

Laurent Pinchart
