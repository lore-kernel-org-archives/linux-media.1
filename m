Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D193C2774
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 13:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780146904; cv=none; b=Th9Ek6nv98+wfsUGqDooRLyyIJBDLtth4hSYsl8xsJ8yCpc5I0KDVzipMd4iz6FNSL43D9e2bIj8MQooDKl/t6hkZmvxwbQt2yg9S28rc7gVqSN+JWt2nqF8mSyDyZQBMVsn/bdDiJPGnx8cdw31xIicW7fbkpYJ2hZ0NTF9LIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780146904; c=relaxed/simple;
	bh=GvzBEJRw3/vtPrVwibE6Y+Ejwqi4+H927KJOtKXAk1U=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qFNbSzS+Br7hTuW9aJGQp9+CZ8S9g3yTTPpNnXUVwoGExgE/ILgf6u82UCLlUbR+7Ka+vfNx7iEuhclfKQh5mMfdyhzwI6HSSxy8FBCMBPncIelP8SXAQWdQGPKwXRInGImSD3vR71cX7JCUmfDZgIX1uq1JFG8H3baj6mRimuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=W4LkjG3E; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="W4LkjG3E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1780146536; bh=GvzBEJRw3/vtPrVwibE6Y+Ejwqi4+H927KJOtKXAk1U=;
	h=Date:From:To:Subject:From;
	b=W4LkjG3ECV6tVP/fqG8AH/8VZCuSYIo2vWZtl6xA1h44v+cSIRFqNx+cfF3WHrEvB
	 eeak29tfRKF/4ReucuzTYcWINrhXhQefGR3eQZ8QK1vsabAttiFQVbdEhuLUd9CgSi
	 vLLyT7XUC1mn1/l3PdikBxWA93LhjvWNjugt5pvd/2HyLG7Yks/O1zc4qnU/yw4qMO
	 s1xm774AFkGFW4neHOGDWjZUUxqcDbzhBE62tzUtUr1vAzCwfrb5+AQ3DCbA5Xod9Z
	 o+vZhpRVCx0JFFGhz18hj+nBkxwmB5BMJmVQHy/QlkFCrYP1O7jvLg182k+XGW9GYa
	 oiEPfnEaFEB8A==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id E7F36409EC; Sat, 30 May 2026 14:08:56 +0100 (BST)
Date: Sat, 30 May 2026 14:08:56 +0100
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Subject: [GIT FIXES FOR v7.1] Regression fix for igorplugusb
Message-ID: <ahrhaFOTPrcXYooY@extorris.mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

This fixes a regression in the igorplugusb driver.

Thanks,
Sean

The following changes since commit f78073e84c800ae146ce62447e7a685a5ceeb92d:

  Revert "media: renesas: vsp1: brx: Fix format propagation" (2026-05-29 13:32:05 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/seanyoung tags/v7.2c

for you to fetch changes up to 5e45e0291d1b599a3c5b34ffa75a79f9ff68ab8b:

  media: rc: igorplugusb: fix control request setup packet (2026-05-30 14:02:44 +0100)

----------------------------------------------------------------
v7.2c

----------------------------------------------------------------
Henri A (1):
      media: rc: igorplugusb: fix control request setup packet

 drivers/media/rc/igorplugusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
