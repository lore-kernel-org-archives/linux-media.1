Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314813C342F
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 04:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791864553; cv=pass; b=eE76GDcMglr62Ew31VgD308F630Z5cAYelcUd2egqZmiE7Buv/i6mbDRjM+9MGIGAc6T+JvY8+sCi3Z6glrKsGwqph1VE4V0T1A1qVHUcJFDBFDTcIcnqQsKMban6JcagA7f+upZsokE4p3goxZQjN5cZ0uSCTOniwDbPaDipKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791864553; c=relaxed/simple;
	bh=H9oHXOeow7etE2oz3wpLSTwBD2VuT9YN6Axe/CaEwSk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=j7xHyGuw1rWsInlnvSRSrFehF7ZbB+Fcu7i+/P0STLolvP+d69+CaiTdmSotmhVyfbCzoNezMw8D95UTjbJOKL5WUQYzwUG+M15XHS2ln6eqfjBJ2Qo/7iTl8LYxxv1VYPdOwyRUUWWW9NztEV50WK1m8WajnWQVMlR2oGWVlI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAcCvK8Z; arc=pass smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAcCvK8Z"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6cfb1329979so1692077eaf.1
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 21:09:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791864551; cv=none;
        d=google.com; s=arc-20260327;
        b=hgwUbejFyIdfghAqUgGNUUQL0BPbw1czwsqMHTeMVjEgbH3GucUP5fwoMFL4n0uGFT
         U2yGfqiynTzoLI/guDTQ+dGT/cxGCgz3/7o6vQUNReNXyZec9PdyZA52EZnP7pZxcQJf
         Fgdb9I52d3tahJJq4Uz0LKl02d3RFcs77yxFyfxUmd2nHmQSiwBWHdfnVt3D36HcLTUA
         NB8ZTq6wmTIsUehpRlL3qd9BwMTl1CkXTvu/ERo/tlw7FulheD+Z3axvmGYVpHo/Qe6B
         ylujjj9CVtHMLJ0Pn7f59yeqF/Q5FCLRNbKmcaTxgdqsW7K0pcAw8Mzg5+hn7ZbmeH5S
         Jp4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=SYymT3riQVadNN182lfr0tw+D5BlQUqx0Gbf8LTuo0M=;
        fh=PJ5Tgo8HF1pu4S2QofADILq9X+y97AOzr2QgKAu3MOY=;
        b=T7WnIuCo+lTmsqIAZZHhk4wy82/N2TGWAlLlOzCExg76GWRjk/QxH5TiYc7bZWLMFj
         nLnskTGUUHe2nGQ5SskAvKZRGi9bceHFjPIPt8eOYR/492lkt2Wqbr3gW9+1kx4uTG74
         tPMkPsY2Txiv03ix8blA84wTvUd9V75j4BYc+9sXz9nR2+ksKQOFyIDPP+mh+r0U0d5H
         +lHx6qzVssQV2AavCUBOPVG3I62ZAUaRGT4sS4IG0NFAJv6Azs6wnEwN79NYEPNnXBut
         MdcyWzFjr5Gy7F9eUkgp33mD9BubB08izyHOSaXpF3QJbHeL09l1+VXwfLR7tpLmWMZZ
         l8/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791864551; x=1792469351; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SYymT3riQVadNN182lfr0tw+D5BlQUqx0Gbf8LTuo0M=;
        b=gAcCvK8ZWGbqeuaqUmhMV765QiBfWOeaKf1iCRATcabOcPp7XOyqiZ5NS3W7hcSIff
         MD+sNmvRPwfZQT9OENBKcDn53y+A7Q6BmROVjgob9pVwFj2JzytWRCd4Krh+EMUtZemR
         TRYjbtlTsmLRcG6D70AFDmzPolSHm4/kySh7/6k2mAfP5xmUN6BphHRGxfJUQJtJKjlt
         o/wMbN4ygW5m2pHAYLx3OCekoUrW2Ew+0v+4chgbp5zAury63MowekIy8l4mZU3nwtRj
         peMENM6tXX7oL+pBhRqTiRax4yBA5V9Ikg+SriAdwYesJF2SJW/Qzo+fPtKE/YkOS3+T
         BTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791864551; x=1792469351;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SYymT3riQVadNN182lfr0tw+D5BlQUqx0Gbf8LTuo0M=;
        b=aFymWctXbd15aP6kgzEp6QKaM41YmwmfN0/iULJZsjd5zo0A/81s/kETWg+6qnZa5D
         OUkrPS2HkDuCvdrm9cuQlmXkvUIm5j/+8372riyGmyyn+U01laJy7gVLP+WWpW82g7bE
         VdOOojtbhWksNw0U7s0oP0VxJx59Rz39MVb0Ns8iibU7Q16cKBD6lPiZn68FKXu0Rw7b
         c5FxKJkHe50MFU7A8nzPOd0NRNzrAyYYgD3eiZBsYFhN8IU36JdioxuZ1qSODOSNS5Vd
         EhGefAQuCguCA8HdxIg+rhUuuEkQ1+To4gcux4J9aeyO46xUO0KwmapzevEVYdIg+c+v
         531Q==
X-Forwarded-Encrypted: i=1; AKwUvBy0lTAInKZ0nyKH8ufig7cgVObjJ+5wrKho00duaN1iD+gaEpwWU7BPsu4Lhp/4Ts9cvjtWWCjNj8+o+w==@vger.kernel.org
X-Gm-Message-State: AFq9FYK1V4FrhjArMppP1gkopgmiSouu0R7A5sqf94jID7sv33MOSsSO
	/luZzfOriAgWi1EVrdcsCuWBJr4+m0uBJ3MsN9tqmmzd1bQdsS5k4YyXbVPLXkelum41LAIikyN
	nV9GvYHSnOprZ5rnD5QSrwQEoD3UO5iM=
X-Gm-Gg: AYBFou2eD+fGSObaW+nrVawZwcS73eY57OnaC8OD909s2pVe+IEXfNmMzoL2TujFEeW
	3yRvAnMHX9i33zkNAeda/aa0+LBtOmWaiAZ5XNAsTd3HpeDU4ZJ0mtyHjUJ/MkmLxUBbL0QGWkk
	L/BHpnRq75LUPgXkej6gcIUKWJrdAxILKxwrkF5mQt5kLWrbbRUMEzyQWBMpfubRRPj0bzq8jjF
	A774rQI8uNd3bIyYtB8VDGa4A+cXXPQ5z9MtjkVGHTkBbpGYi+uSOrsaaI3kbRE6jKXn11L/zeU
	pr7P8y61OE8f1rwwH7KkDv+xyhWqobBmOPCGZaTLWC9DrACM0tupT+d/ObUz3SJdO9y1Yok4RSa
	TSNBngHH/6xBFaeHjUuiO7Gix6yjjKCb7pimn87vJZM6vSAEkB5VxiDDClz9xK/Qizm18jWB+CZ
	fzw80Qh9cXwibMc2uhdVV+S3g7SStBw3KAhIc6EoZn/mgLYNf7Dhyr5lkZKj+ZKIMmpQ==
X-Received: by 2002:a05:6820:82a:b0:6f6:3762:5f9c with SMTP id
 006d021491bc7-6f637627061mr4081990eaf.11.1791864550970; Mon, 12 Oct 2026
 21:09:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Nicola Fiorillo <nicfio@gmail.com>
Date: Tue, 13 Oct 2026 06:08:59 +0200
X-Gm-Features: AclHuK_betxHCyI4TIli2TPj6vrcBsVwnI89MwAoILwlOjGEgQ7aoJF_OGCoP5U
Message-ID: <CAJn-UjW-tKNRWTjVOQPe9d-wh-Pdmnw8EEd1vmL8k=TQr--t=A@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] media: Add GalaxyCore GC5035 and GC8034 sensor drivers
To: laurent.pinchart@ideasonboard.com
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org, hverkuil@kernel.org, 
	dan.scally@ideasonboard.com, hansg@kernel.org, u.kleine-koenig@baylibre.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

  Sorry but I am not an engineer and I don't speak English. I only tried to help
  solve a problem that has been around for a long time. If it can be
  useful, the repository with the measurements and all the material is
  available at https://github.com/nic-fio/chuwi-hi10x1-cameras

  (Translated from Italian.)

  Nicola
