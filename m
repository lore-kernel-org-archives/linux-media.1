Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7710C4BCAD0;
	Wed, 19 Aug 2026 17:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787160129; cv=none; b=n9dxOD7v6ofloEime5xd7PBLPEU254n8yALvipNyftO2FDKeDtaKKZBNlLwxu5WVVdM7bZLWMfj4Hn0k9k7usqgyxvpl8RaKJpBgxfW8kZ5kfKojHTECumd9w3/FdRiGXumugGRQ0CB+KsV7x7xojC2ZEXoeakYiI9J9A0lNJ9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787160129; c=relaxed/simple;
	bh=8z0Zul2ywuc5sWd+Yg+3TPUhOp2Wd2e8/Wl5JRxy7ZM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=TB9sZkufX58GEcEMd9fIK7hhr/KITmUVIDZvZfQyBSNXVknCmsmBltRkKequahH7WjKCQLBfSqSabbydNufXFW4wny+6qVz8zs41JWSpzB7FhkVwRW34yMkDtcbEr8RVpSwEmoq7OpzmV1czC6xqpl5GbmmJTpWr5N/GtHGYG34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BRB6RJpp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BRB6RJpp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1CC81F33C5E;
	Wed, 19 Aug 2026 17:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787160110;
	bh=jZLdBlIZaNAyXsnjwojOI2Ly+WTEFwg4rf+pLnlR8fU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=BRB6RJppiI8kKRzV5OPxaQjU3T0Rd5sHv/JpdZbd5++OqMWsUFVUuLeDDHD4bEG36
	 kqlicUR4QFsPwhfZH1YV23h/jj2QIp/XRAT2P+70NyCRHA48b4dVdEG2juEcQK/Gec
	 QF7p10v0NohMwInx93vKW5n9tGZ4IBYOV1HBH/but02L9NijEjUbRinc4LPeco0kby
	 9s9+c9m9Mfxpp8TrBLM9j9+z5D9ThPO0Od9IppreebZbjyDqJosBKSEa6cMOUjQkA7
	 kzl7jIXWLqtTBX0b3q0pEMAHculjyBUhOWSriTVXLpYZ6GzHaZmjFX4cqrgE+lTwPd
	 T2/NPJP6lmF9g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1994A38119E6;
	Wed, 19 Aug 2026 17:21:03 +0000 (UTC)
Subject: Re: [GIT PULL for v7.3] media updates
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260819100501.776fe795@foz.lan>
References: <20260819100501.776fe795@foz.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260819100501.776fe795@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.3-1
X-PR-Tracked-Commit-Id: 4900cad020c0580dfb1be27776ff10a4ef110cfa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f4cdf7ca9a1fdcca413157df19753f388a5a224e
Message-Id: <178716006187.3599392.13850285361080168391.pr-tracker-bot@kernel.org>
Date: Wed, 19 Aug 2026 17:21:01 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 19 Aug 2026 10:05:01 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.3-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f4cdf7ca9a1fdcca413157df19753f388a5a224e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
