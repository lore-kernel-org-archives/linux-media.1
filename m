Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD0730649C
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 13:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181966; cv=pass; b=VGBClFtL3IFXL7ZfC3OkVNOlJXAtdM1MlHyjQMo/GZ7N/Y4ewEDh0zVEZxjk/7ZK60ByujvCchsflXIfmBgpIXQGq51E06cI1mYno3n6oNilkktrEzGw6fdTKKBVehY4KWM8MmRNW3vVuaBtnezcRE8/3b7s2mcrY1cpYv36fUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181966; c=relaxed/simple;
	bh=HysHiL2VRlqM9yAPSNQNOM34G5A/mOcb8+1e4IfygkQ=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YlEALddmd9NekRfDA5dmox9totawaNpejfEZBmLxNMOstkfIXn/gO5vgj+UmfIfgCb454m8CQdKiJ9yWRh5gnxoyEI3J/aAl4WglT3rvXtHZv+WF3U3V8sEB+IWcoXhtNR9PgU+FOB4Y+noFnomvgCZXDVH4mt7vU0YnPgmJp7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VV08GCSS; arc=pass smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VV08GCSS"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6b1334a3b16so1343093eaf.1
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 06:12:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788181964; cv=none;
        d=google.com; s=arc-20260327;
        b=GcMUAm6jYkL1zJA9nI3lMP4ZFvupUGaCjloGHEYAmR/ISnfW/4V1Z5BLKMIZNxNcMq
         U0wlppSgE7nYSvk04Elyddde7/omjHPGbh3wtfiPx4i7q4N+KMSoqkl39QKHcbVFNE95
         uXlcZ0auVYPlKO7Kv2U5aKsxjFCTWdoO5MAJ3xRazJe8wZSQ6ay/CzeeDkkOoQbJ3prO
         rNtzgnvKuSVvc/KbNone9bcayUxzQ7YbY76yXhy9VcsOQHpDzqR6ZZvZ4RnPvPYaK9MH
         OdAMT3SXCbt85o7DfKvmaitr8PFokkKdVTjiZQ7IjSzAwt0Lqlob0xA3dPmT2XPh/7V7
         /NIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=6dwdlMhiwvvGNP0Nbpo0VofOYlqAm52W9bR3+mOccsk=;
        fh=xBC8I5G9NTzHLz/xc3ebLlFN8Nk/HltbmInxXYeBQQk=;
        b=LLiFswSIX00bU3Z+svGieI3fjxskdT6j7ZCohaVp4vnOPCaydyjCRgWTyRLZoXbPIA
         VvbvFNoU0Hr18aC8HSpQM1j7lr4r+rUR0KlHPej9IThKJUFk1vOPK0kYaCkJd7g1eJrK
         O/OSTyx3xtKBhJfjJfGQPGTH/r3FBWQwtleP0qn0S+IHDJoAwQpckFG3Oxc1BlQmhZYH
         TAAE3QaVlVIoxrtkdRPVkzhH32e9BI3ogUQzyTIakdEwjrPWI8FlqhmvPdPVdGlKts8Z
         w+6aMNHsjx9nqcj8jgkUrzBvPd6tcA3DGDi4R5iSf+5VBTQXLGMC0EcK9oI8nZSm4nYu
         E85Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788181964; x=1788786764; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6dwdlMhiwvvGNP0Nbpo0VofOYlqAm52W9bR3+mOccsk=;
        b=VV08GCSSbfrHjcHjIU7kpu3/DRyWom83v3aJm96eETFzTCLGSqx3rukmZrIbyLigAc
         emYI+CK5E+0RSSEKyz5n8L7TKQUkNdQM2fR2Irs1TYhdD7X627+b9K3bpfUL/OMXo5cx
         13382coWUe+MIezB2Y6qWK1UZCXBK5JSA9FO9+VsyYGz5VbqxLmtEamIO1iQdRVT+geO
         mlVx71hXS0TMu5ol/WMBqfFNQQvxfjzJAbZJGUrTrbd0H8otCtA+Q4i8fgd9jBG4JWNF
         m+YBa472A3cAdBPhbYoqqIcsOC+/nRT9RnwxDBEbqrwV4OCChgBkNTBNMVTeMdBKIKYy
         a43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788181964; x=1788786764;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6dwdlMhiwvvGNP0Nbpo0VofOYlqAm52W9bR3+mOccsk=;
        b=AznPJxWbytnwM0VfBBhT0+cI3hU3WFxyTqlex6gCQ6LDb1dEo29agX6sM5pxN56QMy
         fD+eOlhchHwd8NxX06jKBDvedV1dG7d6g5iyEDsgYFbimgk5jMbQxOblVPJZ9YPBeYfP
         2aCGt9yWzw9L7nbOufmv4Y2/0RDkIFqU9HQ3O6YJUl9vxXjPYkfBMPENvUP6EO4oSHg5
         AGESKpakFHpqUdmG9iW3D83gFZW4hzmLb9S7kvZnvsmduJhrkdZyD9S5B/xxUwDts7vj
         pgWdHCt5ap2HnMbjuc3wkvfJ0n4M2Y5ZRRXK2yxQLk90+1FyNp2ozdiAR0P08Epi/N3g
         5fPg==
X-Forwarded-Encrypted: i=1; AHgh+RogheVXSgv6iUoqaH4MKzV/LcBkP1cvo07S+SQL/m9h6EaFaL8X2cO9xAHtFYZIKh0BTEPyB/e22e+DNA==@vger.kernel.org
X-Gm-Message-State: AFuF++noGUviYsDJL1B7wAus3PG0WS8il/bxLdGn3dySnedBkwcHoedU
	VYBnxKHMoLGJSMHZDhOlIGpTnpu8Haf9pjN83WHGpTc26REcbmrLkUZ2joyeQu8ixnEi3JM197/
	VcC0uS3xwtd/4NanQLHTuE6fsyeEMDJ3oidUy
X-Gm-Gg: AR+sD11Q2jffdpmlOtNhej14RqQqSS0xZanhn5NK3Cv/GRAWU8SJpB0KfUFZ/cZCV3g
	tWE/3rzN651riyqs5xUezldQyaI3Xb0XtXiM2IXiIReI7piwMwVZKMMtXieIN9ezcLVFoUOwOCu
	1bqLaSGnRbBW3uOeV1483Xgf8fNFBYeRgykowQLu74OPQtvyb6wZwggKSk/wxxic3A5Pml6GSRL
	nInmIfvmIcZk8SmV9uFW1t85hiJwoPFJ1+n6pycyLTVYoCFSxoJeH7yAZMKcEpGupkF2BM4V0ho
	pbsf3I+VRjlGOLZSv4e1tR19UAt8xQ9/83p4ZytGft67FkR1u+jUTEvAWZrH37AQHuGY+H8OggH
	gBbeI0lZckyg6Bu08hBhRHGI=
X-Received: by 2002:a05:6820:824:b0:6b3:6bc7:2ea7 with SMTP id
 006d021491bc7-6b36bc73476mr2621340eaf.7.1788181962932; Mon, 31 Aug 2026
 06:12:42 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 31 Aug 2026 13:12:41 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 31 Aug 2026 12:56:57 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <apVMALyPsJSsB5BR@ashevche-desk.local>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <fb26c4cb3dae5d87ee877dd558d6ea5e0b3926fd.1787933456.git.mauriziocasciano7@gmail.com>
 <apVMALyPsJSsB5BR@ashevche-desk.local>
Date: Mon, 31 Aug 2026 13:12:41 +0000
X-Gm-Features: AcwNN1WESpYlXZuMNQwNmJqDlEN047cygLvkqCI7j1Rkc7gQt6d8EHm-v8YRiv0
Message-ID: <CAO7O_xja+1XutiXhXUZ8k6+cF=P33htUVjxKZ1ELWR1brb4knQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/15] media: ov8858: Add INT3477 ACPI ID
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jose Maria Martin <jmmartinf@hotmail.com>, 
	Uwe Kleine-Koenig <ukleinek@kernel.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andy, Sakari,

Thank you. The use of ACPI_PTR() in v4 was intentional and followed
Sakari's explicit request in the v2 review:

  "Please use ACPI_PTR() for this one."

That review also referred to:

  https://lore.kernel.org/linux-media/20260828084328.257703-1-sakari.ailus@linux.intel.com/T/#t

Andy subsequently noted that the last patch in that related series was
controversial and had been NAKed. I should have called out this conflict
explicitly when sending v4 instead of leaving the rationale undocumented.

For v5 I have retained ACPI_PTR() for now. Removing it unilaterally would
discard an explicit media-maintainer request, while keeping it without
clarification would ignore Andy's objection and would not earn his review
tag.

Could you please confirm which form you want for v5 while the related
ACPI_PTR() work is unresolved?

  .acpi_match_table = ACPI_PTR(ov8858_acpi_match),

or:

  .acpi_match_table = ov8858_acpi_match,

I will use the agreed form and will not send v5 until this point is
settled.

With Best Regards,
Maurizio Casciano
