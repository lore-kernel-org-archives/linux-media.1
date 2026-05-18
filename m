Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BA444D693;
	Mon, 18 May 2026 17:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779125533; cv=none; b=fFFlqLBev/UqlCDzSV2fB81PClBxEm+XbWB4L3hYYG3183rBIbAH8gcJe07+3+WNYxsxHkuoAOodlT0Hr9Fpz6cNmXKto/k0WkGHuHwudPojFaSEZV3Xm1eL6y9TyGdkRQffhEPth8ZsPXm3pYEzqdIj8CSJUksfK4azAXPQIWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779125533; c=relaxed/simple;
	bh=lEWYnYpPbxcUGKMgrEU1l5AWoFTi6bh6oxRNUsJe1rA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Nj9/RWeeXZdT1+uMTuZYl2tNcFDWcXhC0DpuFQKU3iaho3iXt2YDwe57JInjvpq7VoW9bRDyeqT3aDq+AMd1TtoNlEVE5J2vWcNDk8grwwctHenZW/JXDJOffuDOyfDT3OiaTypQ55XqpNHtRGbY0pD0tts952IxvawaixZqMnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sOpODCtS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sOpODCtS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D713CC2BCB7;
	Mon, 18 May 2026 17:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779125532;
	bh=lEWYnYpPbxcUGKMgrEU1l5AWoFTi6bh6oxRNUsJe1rA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=sOpODCtSxYUOhy3aR0qYnmLCwXL9AQ30rhJH3Cg06UK95heURrsrRg5skM10jA5u4
	 mACiTpC6CsukIZUoioBCI0r/I9VRLQR8anKdwyapYFSIkRa+KJD4pqfda+azcPlj5T
	 16GUuMfXDc20BAy7lAL4zKbfg6Y8XKd9d191nVlj2LXeHuTj0U4OJLeiAOv9dRJ2Yp
	 SfbF78DPks7P19cc5v/Q+4tTCTOKBAcSxvr7GjfZj6jHpgBnhFY8Z752DlHiZJkkTN
	 3N2xZUR5hBlccVM98ZdaxxiOeRBurg9xotw8rnkH0H5OUP90WbFo8VH3ojusr/9gaI
	 PwS3RTLiuXo5w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939F93930C9F;
	Mon, 18 May 2026 17:32:25 +0000 (UTC)
Subject: Re: [GIT PULL for v7.1-rc5] media fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260518094152.581e5e41@foz.lan>
References: <20260518094152.581e5e41@foz.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260518094152.581e5e41@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.1-3
X-PR-Tracked-Commit-Id: 646ebdd3105809d84ed04aa9e92e47e89cc44502
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4bf5d3da79c48e1df4bab82c9680c53adeff7820
Message-Id: <177912554410.1907084.16038779345296881736.pr-tracker-bot@kernel.org>
Date: Mon, 18 May 2026 17:32:24 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jan Kiszka <jan.kiszka@web.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 18 May 2026 09:41:52 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.1-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4bf5d3da79c48e1df4bab82c9680c53adeff7820

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
