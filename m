Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D03637DAD5
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 17:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789320235; cv=none; b=Gp8UZm4cqkUTt1TjvZ8KmvFSLbyI0xjRpFcdwjdFnDhM4dn/iQtFQhfhHgCNXiytOOSEdd0qgGXp1p0CQlu7FHkVW8qlIXl6R4dPu4E2wY0YZVpllN/AXRLwrC/ia2ZvNDcp4HgDM4iKEXjaxv2h9bCbgBa39wZgtX6ooCmS2qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789320235; c=relaxed/simple;
	bh=Ehye9TJLwU4RhfX67wVFCxBg2CQBSsxulMSPvl/IP+o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cqj+YEvY06HmUu/SLmnYl+ih+XlRPbpO7BKkz6KxwaGObhSLw1yLG4MoSjwnD54gSoiiaQEIhgVmozgWFHSkf9GsSJRteyzYGJFzbEv3r9Y6e+eRtpgSxKGDPZUnCn9BzEAY/baxk+phspHhrPtan7SMO6hdYrx6Dbd4MEkl5og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Mg7el7p9; arc=none smtp.client-ip=109.224.244.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Mg7el7p9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789320224; x=1789579424;
	bh=BwWBq3qYC4PfPQFekf5LFFSp4I3QWVfzFw4KLv36u9I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Mg7el7p9ZkOOdW95ZbhEdLmG9O/Eb4aorjsQ6OA4Q3gYl1F4AZ7pWTPXumUZzRVWC
	 EHKxskk2kdV+Xa2PTDVHLTmRVrt/RqgnzBxuM8DrRfVUzr/rqb0IkMn0R0o77dgXL5
	 2NfDrV033dqj5+e4wvJzpHoMVN6lBWz3IRgbHPN/FlrJDYc7H4Hm8SeTsflGHXWvK5
	 cifpdR93Y8M6yEW8Js3xHWTRZg4CYhK8vX8PCue6oSEu9LrCMivR5FlspoykiIgHm0
	 2tELsCLP6Tx3PjSWJQuv9NCmt7ykm4nzks15fnQ8lSTYyiZ3low+qU6QQv7rRp4C5D
	 UrfZ5fHgGqfKw==
Date: Sun, 13 Sep 2026 17:23:39 +0000
To: German Pablo Lindo <germanpapulindez@gmail.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org
Subject: Re: Test [PATCH] media: ipu-bridge: the Surface Pro 11 rear sensor is mounted upside down
Message-ID: <20260913172332.85174-1-lsa.uz@pm.me>
In-Reply-To: <20260913170144.5491-1-germanpapulindez@gmail.com>
References: <20260913153526.80287-1-lsa.uz@pm.me> <20260913170144.5491-1-germanpapulindez@gmail.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: e5a63d3086a711c4a0772461d6259aae0c4b4608
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thank you. I will carry your tag to the next version.

I want to be sure I understand your result. Please answer yes or no:

  1. Is the image now correct on screen, not upside down?
  2. Did you check this in Gnome Snapshot?
  3. Did you check this in qcam?
  4. Did you check this in Firefox?
  5. Was it correct in the live preview, the moving picture?
  6. Was it correct in a photo file you saved?

Questions 5 and 6 matter most. A program can turn the picture on the screen
and still save the file the old way. I only tested saved files here.

If the answer to 1 is no, that is fine. It does not make the patch wrong.
The patch makes the kernel report the correct rotation. That is all it
claims to do.

I ask because I tested it here. I captured the same scene twice: once with
the patch, once without it. Both images are the same way up. The patch did
not turn the picture. It only changed the number libcamera reports, from 0
to 180.

So if your image is now correct, your program is turning it, using that
number. I could not see that here, and I would like to repeat what you did.
I have the same tablet. Please send:

  uname -r
  pacman -Q libcamera          (or your distribution's command)

and the version of whichever program showed the correct image.

If I can match your setup, I can find which program does the rotation. Then
it is a question for that program, not for the kernel.

Sergey

