Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F28D23EAAD;
	Tue, 30 Jun 2026 19:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782847870; cv=none; b=u+8hGvKeiXwWxW68x0rnZB7vqjLHAHFtGpB1G3IQHGepO5NF1tRq3HXxY89PkpIayMdSHnawxOGdVzQDK3kuq/hnjKQL4BgUdlq8RMnZgzNDEMQ+eivN7cjsjFDm2xp/4eMj1vPW21j5qIGUa8J/8lrLxFOpNsI85Yfs2SrOQxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782847870; c=relaxed/simple;
	bh=F0CbPaZrn+c51x054dznBa6vx1FM86V+i31hep7LOXw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=S5Rec63DEqnLqRo1FQd6w16+uuiAvpVGPUyhsO9zGZPj9Pr3HnpP6/sdyFT4WgTUH/J4Pooc4m3/XfFiFVH5BqN6sxPVf5NR4mYcZvsIk5Cgt6MouiUI2d+L1G/CFf94ndpJvXN5d0i+089kOdJlb9uWJH8o0ZAAL+1zEZUSoYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=RPIlZZbv; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="RPIlZZbv"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D8AAE40E27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782847869; bh=HacN09d4Hv1Nvj7JuDt1yO53pbgbJ5yVh+8HRqC41UI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RPIlZZbvOpm0VPRZYmToGChFFLCs6bSeuzHxPG7eUTh98rgAPgqewMe6YMjXy93dv
	 t+fSoyhK9efkCTgUVbZNoAfb2EVgSdvfZ7kUvR3KerhZtCs0LauZG3plRA/oy+1mMt
	 diRzikBuA3d3DczTe5giOuCl+9xP6MRAFnxGN9UcUfeSn4H6lZJrz5IH032mTigYCp
	 Ioe0TATEUONWD1mB7WXMrZyM4hT/IfiWns4dm+OTCTcJlZrrZ4+LDtmK+1pNZBPNeG
	 B33ivP17hXL8gbbWEWf0AhgwluCq0w37PXYDcN0jqjPtxO9D4MhKIHlXEhaGZPWjq5
	 XxZIKwarqWjEg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D8AAE40E27;
	Tue, 30 Jun 2026 19:31:08 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: Re: [PATCH v2] Documentation: admin-guide: fix brackets and
 translation issue
In-Reply-To: <20260629110812.69420-2-manuelebner@mailbox.org>
References: <20260629110812.69420-2-manuelebner@mailbox.org>
Date: Tue, 30 Jun 2026 13:31:08 -0600
Message-ID: <87cxx7su4j.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebner@mailbox.org> writes:

> Add missing ']' and replace 'neuer Name' with 'new Name'.
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
> ->[v2]
>   Fixed one-line summary
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 6 +++---
>  Documentation/admin-guide/media/bttv.rst        | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

jon
