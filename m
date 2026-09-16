Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7CC1E0DD8
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 17:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789578484; cv=pass; b=VK9YsMUF8U14tngGHNAlQggz/vdipbRBY0hM2OTiW3uHoV3M4tbgZy3fJ2IC9UJ2K6mU3WyQ7OQOIj3d8nHxJgEuK1WxSfDx5CkOE2Lg2YQbslq7pB2EdRr3nmu1DgFl4E7SqaDUj1iUJcWbzgsDprbdK3MYl00WgfcE5cffxyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789578484; c=relaxed/simple;
	bh=kxjCVLD3LjsOhqL0d8VPNaJDf4RDg4aXxoVoBWW7dgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h8pRqGv632aw+k4GuzZk1KvjAFVnixaN+ubXRFmraMSe8PPmbSqlOM7zIqP2RbfPfqgp8qwavSstglKEii5Dhc0SEKqMtYhiPDf8jL7tEGFBRtB//r6Uf1zpxl9b8V6/RntvoeBliBwrXnfzfkOP4yBwqwrmPZ2FlYefJwdBZKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=gkP2uX/9; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="gkP2uX/9"
ARC-Seal: i=1; a=rsa-sha256; t=1789578472; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=k0BblBnTqgf3eygKZEvZmHVSMb0d+OsPJmJmncnY1tCv0G6cCKK9Xi3kJLPkQyxKNT4u3YhODQK9q1hFyJgGpKCQkwC+iLEWZWLzwoyeD8UqBQvCjyaJsTfdZ+wQkmRw1SNUIDO5aVQpey9vrZ3HNsehYAysJWBT4f2wjlF0xr8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789578472; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QzJV4EBZ/ZPPkHNUSlAM078NEu5vA95C97LBNrhtpQo=; 
	b=Gg9tBQj5e1HefZVI2gNOX4Zzolw+B9VN3VYtEw0vNDdPQkGdyj2ciDHYkExT9ThLujTVNHsyW/lpVja+A0TA0l3AwF8CWam0L5ubPxAu2Q8U1pFFb40E+jZ7VxiwkaiKS2auGYYeOLgSNAsCxELsG0OUsTS2riOWD7tuonSPD90=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789578472;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=QzJV4EBZ/ZPPkHNUSlAM078NEu5vA95C97LBNrhtpQo=;
	b=gkP2uX/90T+O3XNAR2uvUEEyEA07NRJdkY7yliySTBdM6862FVAs8u3pGxhZbv9b
	HlIkBUysR9FbTO4d53BCWbb+OV6n0z7b6rRlZVirx5rhfPfv7gCV/IhnoDCGNcA1HOm
	JEHfMdOx1TUdVnz8i/WW56YyWTCvs6LHeI2hla38=
Received: by mx.zohomail.com with SMTPS id 1789578470483327.4383597870594;
	Wed, 16 Sep 2026 10:07:50 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH RFC 0/3] utils: Add the v4l2top tool
Date: Wed, 16 Sep 2026 13:07:49 -0400
Message-ID: <e_sk-IZPRRGozyk_ZJz9zA@collabora.com>
In-Reply-To: <20260916173305.00aa071b@localhost>
References:
 <20260916-add-v4l2top-v1-0-470629ba5ffa@collabora.com>
 <20260916173305.00aa071b@localhost>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

Hi Mauro,

This is strange, maybe a b4 bug, because the commits have the v4l-utils in the 
title, it's only missing from the cover-letter, for some reasons. I'll have a 
look at what b4 is doing.

Detlev.

On Wednesday, 16 September 2026 11:33:05 EDT Mauro Carvalho Chehab wrote:
> On Wed, 16 Sep 2026 11:20:41 -0400
> 
> Detlev Casanova <detlev.casanova@collabora.com> wrote:
> > Hello !
> 
> For consistency (and to help scripts we may use) add "v4l-utils" at
> the title, e.g.:
> 
> Subject: [PATCH RFC v4l-utils 0/3] utils: Add the v4l2top tool
> 
> Thanks!
> Mauro




