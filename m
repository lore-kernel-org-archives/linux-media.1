Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10CA331EB6;
	Fri, 19 Jun 2026 00:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781829354; cv=none; b=k/QPAANmw9C6ZfHUozXJ+tK7nU2HAd1wqE+rIdBJGofLrLqRd0lnwYanRQ74GDCvwo6jXIjpjK/0G+AGc2VpRIEZf/s+6eSzSLH4yVoGOqkyYT7yN9n+s1zlEprL8CUEN7OmCBgxNU5rugdWkIa46vU2pBNqq3s0yP96KUrKueE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781829354; c=relaxed/simple;
	bh=/HjymnnSQHHmFza/byuBCqnDeLVFGzEr4N2lZ3LC8Nk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=OdhPzzAVAbxOTyIEMZqX4aCP39XLJI2SXhmVIcUopQJUOaByEkub5jZt0YiA2axfaOUOAnoXIG0bvUUIzGfPy0iu6L3U9u8ue+hRdGy2i4VxNlCcRkmquKgGi2+/qagY4ueUbxiHxr1zyfU2UAZDl93pIizElOuqe6PvWFBaCio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OM+BC4Kk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OM+BC4Kk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4835C1F000E9;
	Fri, 19 Jun 2026 00:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781829353;
	bh=1E6gLa3V/ocAXqJ3SbGoHfotayBL3wGar6E0nTJmo/o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=OM+BC4KkaLRQjP1AdJUKMnN4x605k7zMZK5WOJYZRW/Rdy38z0nRz3dS0RLvmD5S8
	 HzZ5lzRV48lyC0oZ77DuaLBMYMpIa3cX9zChU3gQhcF50LQi/r6WX5V3YFN1M+a3Fg
	 QhkwNrLjzIa+Y9I4dWQYLC8jSXnGbtZQw3TpVhpsk+H2bHyD/LLJWTuHxLTw9zGEoh
	 gt8BvHfQF4fdqVH5jOnUYTT7WEs5uB5TFWe8l5N77OlJ7wqcdyO/ODYMEPXBp+bjwu
	 YsXswKT4pxOOPm+zBna70zKzG/uxvU4NZWxOXXfMb2LgGgF1vDrPHVdHZHMAotNA6n
	 pil6dBhXJsqmA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C71523A56772;
	Fri, 19 Jun 2026 00:35:47 +0000 (UTC)
Subject: Re: [GIT PULL for v7.2] media updates
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260618233827.582d50a8@foz.lan>
References: <20260618233827.582d50a8@foz.lan>
X-PR-Tracked-List-Id: <linux-media.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260618233827.582d50a8@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.2-1
X-PR-Tracked-Commit-Id: 06cb687a5132fcffe624c0070576ab852ac6b568
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8c13415c8a4383447c21ec832b20b3b283f0e01a
Message-Id: <178182934638.3132651.5441887166326044530.pr-tracker-bot@kernel.org>
Date: Fri, 19 Jun 2026 00:35:46 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 18 Jun 2026 23:38:27 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.2-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8c13415c8a4383447c21ec832b20b3b283f0e01a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
