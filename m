Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E189E2F7EF7;
	Fri, 12 Jun 2026 19:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781291934; cv=none; b=bFxxu++LRJ4Qfe0yEx0J94fCsYhZXgZT/ylo6OoFEH7aGqA3qA7UmUx/54ZpygAyUgRBGBE4F0irNizDd3OmH+AgBctbQfMYSLH6ZyQrELNPvGHRFXytLyYfq3j1g2V5MAtV1eBuHpyuJJeVjjVFweeCQFHEXqrLHkceQ23Mmbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781291934; c=relaxed/simple;
	bh=LrMIAmidvmh9DGRCTN9kkeMDUAufFD2wTeWIQSPmOws=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oyucqA8M0xR3wyCBMcVzsqh/rZBZvbh1BIRbRt+rWc6/CR3dmTUUD1jqQhMjAMN8U5G9X6x50p16+5p4QheXVjw/g8sPMkW1ua43X3nKfnlvx2NY6Us6FH17ywyXzvoOV3Cn6FxaBoLBtNE8kgBwCg/Rj11EPRQHIx7fw99jsrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=kyWhkEWo; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="kyWhkEWo"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 484F840E4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1781291933; bh=a8hXTDjdIj3T1WUT5mbFahJEnuuxAhS1puwBFIjZFwE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kyWhkEWodTXHn76sWb/kiN2JGhKPuzoR2ZOTWq6yhYrlRQasyCbSl3IOBvNXO47ZJ
	 AjwVCKcoif12xtmoccvedoM03osgyJjGG7Mp7Rc087q7YQz6k91UnuFlo9+jb9UkCi
	 fBFWKHkpa0R/88v5IVgwYd7HQuf4n9Dy5dW01Jhw8lapfTGL3qLTdGSyvrbMXsEmnA
	 /1bJ0g4T2j/tsxF5CqMI7XmMwefqAk6w3QlxZPYh2VlN2eJnoxdpwp2TsRq5glzW2s
	 U+OBPKfwGp0PZpbmfW/yQYtRV2OlnWJjmfMgLfJhEYInSZa5ixLu1lglQKTbecc3/P
	 JFyIeTvSqzsnA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 484F840E4D;
	Fri, 12 Jun 2026 19:18:53 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: Re: [PATCH] Documentation: admin-guide: fix bracelets and
 translation issue
In-Reply-To: <20260611075513.124994-2-manuelebner@mailbox.org>
References: <20260611075513.124994-2-manuelebner@mailbox.org>
Date: Fri, 12 Jun 2026 13:18:52 -0600
Message-ID: <87mrwz7ejn.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebner@mailbox.org> writes:

> Add missing ] and replace 'neuer Name' with 'new Name'.
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 6 +++---
>  Documentation/admin-guide/media/bttv.rst        | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

The patch looks OK, but when the patch itself introduces new typos in
the subject line, I conclude that not a lot of attention is being paid.
Please fix that and resubmit after the merge window.

Thanks,

jon
