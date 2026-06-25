Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4B232E12E
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 13:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782394389; cv=none; b=lTGphIgMCHDWQ3GB6rtfN76IXZq0huVXEImcTy9Hhda7sUdSQR6RQ1/v4VHqIrQPsISnxTvUcS/Ey8G5U7jjO+SG15/tQ+seaUlp6qaDYEpO9+t6PpE/ckZjn/Oo2/6xSX0diOfMkOPRSDthSz2axNqhDyrJsj8R2gb0Ds9mJrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782394389; c=relaxed/simple;
	bh=M6AMpAtucOfQ0fsOouC39sh/vyDlHIpE9WNW3F6jSTo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JtyP8Url3CbHDVloZLjR6HxjQX2Mkvt9+77dRgFN1D9vuZIj5cQzEvSea6q9f36u43/hUKD38YewQOlwXiZa2gXMfiPkId4X9vSZYujATcCt5/oyfBj5xrpdDj1pOpok3Nc0zb2zS12iStMF26XmwvGqeq1xQ3fjpmYATyx21h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bNAFcWzN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bNAFcWzN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B47B91F000E9;
	Thu, 25 Jun 2026 13:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782394387;
	bh=w3v/24ptd4YoqAlS2GWw3tpwst4Tpe/WHLJzViIkmOc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bNAFcWzN1uKw1K0DgoArKiLiD84WIfSuEdEi5ZDK0tVEF9VYEBEq6NQ4SeiWPVdT/
	 ziDgEY6Kwd1TqQRjvwPJOITNQxAJJUwAlBqT1OGuWQvpFARGraUKBYRNEXag68L64d
	 ROKSLQBZCkf9LgGoZ5cFB3TJ/m6Ws0U49E1TpILKtlC4399YNV74sepvANr/+IrS1L
	 dRTRN84VdF4mgLD8UF/cscGRCetNENyeVjl4+WXFwAsD4g11nE7ZAFbvb6rPQLCyPZ
	 vRe9jzPrIOy1yIK2GSsFKxUHYz8/A0UZE9zkLyUkaUcQjygGhHlsULfZV3y+9bZshx
	 Frc6yki5N2C3Q==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.4)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wckCX-00000004EAR-29Yu;
	Thu, 25 Jun 2026 15:33:05 +0200
Date: Thu, 25 Jun 2026 15:33:05 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Sean Young <sean@mess.org>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 0/4] Cleanups of rc keymaps
Message-ID: <20260625153305.6cf6d597@localhost>
In-Reply-To: <cover.1782300922.git.sean@mess.org>
References: <cover.1782300922.git.sean@mess.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 24 Jun 2026 12:39:16 +0100
Sean Young <sean@mess.org> wrote:

> I've written a tool for media-ci which checks rc-keymap submissions.
> This tool found some trivial issues.  
> 
> Sean Young (4):
>   media: keymaps: Remove obsolete RC_MAP_RC5_TV keymap define
>   media: keymaps: Remove obsolete RC_MAP_HAUPPAUGE_NEW keymap define
>   media: keymaps: Ensure module name matches RC_MAP_VIDEOMATE_K100
>   media: dt-bindings: rc: Sync keymap list with latest list
> 
>  Documentation/devicetree/bindings/media/rc.yaml               | 4 ++--
>  drivers/media/rc/keymaps/Makefile                             | 2 +-
>  .../rc/keymaps/{rc-videomate-m1f.c => rc-videomate-k100.c}    | 2 +-
>  include/media/rc-map.h                                        | 2 --
>  4 files changed, 4 insertions(+), 6 deletions(-)
>  rename drivers/media/rc/keymaps/{rc-videomate-m1f.c => rc-videomate-k100.c} (97%)
> 
Makes sense to me. For the entire series:

Acked-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
Thanks,
Mauro
