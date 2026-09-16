Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A595616C1
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 15:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572797; cv=none; b=f+yeD3qb8rCF+WlDrt9/TsFAinlPz2Xbg7/MzaApJvwnmUCJN0L4ul3Sk+sTWRfVYxWeDbHvocdnT8Z2++fpQDsPsuG0+hXZqvpGHW4rb+zgXU31VqqNFGvs2GqEARHYEQRxNWHP+wzcZj0qhmmUx//vtw75A8bVtJPJ7owzDH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572797; c=relaxed/simple;
	bh=qBXNF8rUx0afmYBvm+W9JotUyNED+WYvRCzskuJDCjA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FKc8zitcTHooFDAoKfquatkowaO3bBQ63gd/LIUYWOd4+ay4BFJDQWK3001o+H1lfdLUHdEoJ+4GLam8q5FXxewWIM6oVcmLQPxYRkpkClePmg8xtr+hwRxvOzgz1b86AehX+OxBbqh6hAuRoDSk0ykC/PIBu+EuAPWUjCmxFC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bk71hsUP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bk71hsUP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F651F00899;
	Wed, 16 Sep 2026 15:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789572787;
	bh=qBXNF8rUx0afmYBvm+W9JotUyNED+WYvRCzskuJDCjA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bk71hsUPiPlEqgF7MROqqUZwA9bOOzneYIJBi0sJRo4AuKeq6rUAjAofLNLVod7Am
	 FFbUCrUyE4HarlW3jRaTdJLuKxGCWr84Yt1Qy/WUk5C3jTLMg9X9yt7jWE2Y0erDfu
	 GvSsIKB8QzR2LMg55BLN9qYvRHcHLYPfEPfAroV6tl57Wf3Ga4b2NEkyrNqtzyoBBJ
	 ol10D60JLZnvFGGkuHb1Vymn6VbupCqTPrQs1AsIl24isVZpWuwkMnJpS7i3XVyRhr
	 lrfOb5hc5ieLobaKlIXnn/KHQgX55rSW9WXak9C2EZe885sCS7ie8NTwd1Ix/J26qh
	 6Su1Sod//UI0w==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.5)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1x6rdB-0000000D34o-2AWG;
	Wed, 16 Sep 2026 17:33:05 +0200
Date: Wed, 16 Sep 2026 17:33:05 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH RFC 0/3] utils: Add the v4l2top tool
Message-ID: <20260916173305.00aa071b@localhost>
In-Reply-To: <20260916-add-v4l2top-v1-0-470629ba5ffa@collabora.com>
References: <20260916-add-v4l2top-v1-0-470629ba5ffa@collabora.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Sep 2026 11:20:41 -0400
Detlev Casanova <detlev.casanova@collabora.com> wrote:

> Hello !

For consistency (and to help scripts we may use) add "v4l-utils" at
the title, e.g.:

Subject: [PATCH RFC v4l-utils 0/3] utils: Add the v4l2top tool

Thanks!
Mauro
