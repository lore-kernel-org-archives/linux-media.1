Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0220A325726
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 18:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784139199; cv=pass; b=VN+AhiVrninMdCDV+E9k3EGjpCifbwdlQcM61QqC+5yo+lqqQ1ziU/xJs2b+4mB+qfWv8n7Jx/q2HuOFIP3KSybJaqJMduiIDU/yFCxUY0rEOPSsDt+5aOOZ1ZyTh4vYNr69tq50nff2CwNWNu5WI6/vVOWMvGMRiZTgSfO8zpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784139199; c=relaxed/simple;
	bh=6lt2EBngzvD4m9jAx7MuFhujRmAqHqzLhBgtSohJdm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CwVNEG5wIdWQo629eQdRgI8LOIpvCjn42s3DP7KX7zxvmDyDEr+4V4mrP5cGEq1AtIrmyuJHeXmMb/z2DHYLegVPpWm4IhlS+vgSk5PCgUPRbUqCwLrUHddDX/qs7GvfpTsZMsWzyp4FkDvA2tnBptRBgu2US6ahAYAE7Tq+nFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TTIWm3VZ; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TTIWm3VZ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ceab75934dso53819535ad.2
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 11:13:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784139194; cv=none;
        d=google.com; s=arc-20260327;
        b=kCzNR6tQa+KLBy9mLKSbnwDa+d22Vd4l3nvThgkKtHdEAmrp0I7sB1l5b7jhuj7WYM
         gAFPQ5BnStZHh+sarlpYr4l61hvQaMMsUeE5FEQ3IDlOkL7bS4HjfWw8xQYwcumJfeyX
         PFAXXi8LM76lvD/ENP9ARs7WYHFIGsMYSuMy8kjb1SQkuRMI0eZP4g5RBK+yC1UHv4a1
         gu8Wv8K5TpSX4/24S1xaBmTN8sY7kpgGUIiW72Sp1RsTiDRYSy//o4lYh/xV+NNkLiyc
         0RMJB2uAdkujkRab1tX6djS4IeNbS897mqloY5PZ6GDM5Jx5jzQ8eVJBKT2gARdA4afv
         kPTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6lt2EBngzvD4m9jAx7MuFhujRmAqHqzLhBgtSohJdm4=;
        fh=E1ileh43R5bSVfbZyTevOzUspDMBmDyMsoqQ8Z+ufHk=;
        b=grvZCsP61u9LCE3bc2NhHewAAlYrMdO/WCWJyyI2MqX9O16bQXJgvZGS071WQ5nI+N
         EXFyjkbdBrBPALFzHurHdsu2hLtZs8m/5Loa+JG3+UHyWu62KNDCKmq6G03fAglk2Z8x
         J53MwHV5EFgaHlho7uMZ/06FMJGDCXEORAEiwzucPam1w2r7tBI1VFgVHK+al6peZHKf
         7AvdVE4TCiOCbTVwQZNGH92INWjS1+wxHH/pEQdsJVARms//2V90qldV3llNpFonn10/
         y9u24FlLvP75vpsYvDMY+G8Y/l0xDzQUwLn4DeTZxBA0oLkQ8ApH0erg544e5WXyR1/y
         lgUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784139194; x=1784743994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6lt2EBngzvD4m9jAx7MuFhujRmAqHqzLhBgtSohJdm4=;
        b=TTIWm3VZdzcMxAM9YAR8kvHU7kjJ9hewXfAK/SIgTMmt/kcEc+e1rD7LqwTvhTJ7Fn
         OjkhXCNMSbZXl05Tug95wXA3cTRyOeiFiqZ8UH/tpA0rgGpdU0eH2f8HTIqVp14d2Lwk
         3YSwLSAjM4245pDu+6q8T2L7MHVxld5IlGXDiGpJlenNtgtsGY0lNCcBtiDBQkiLXHT9
         8f/4jTdPJmr2uy8DhaFSEtWzNyZxkmS9phbDNRBKixKpDORN9mWxZyYlTeF52X7W4bfP
         Ss8Vj8saSLLV71afVr6giPOrvgUz/UYuc1EVrXL7lPcTu/0b2lqvOR0i1YgGweJO5+Ms
         szZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784139194; x=1784743994;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6lt2EBngzvD4m9jAx7MuFhujRmAqHqzLhBgtSohJdm4=;
        b=sLM3oma/C40P0gsw5wn4LJixNbVJwMpNI/5xR7HLOYpfa7M3a2efbZVZ9TKh04OkCu
         FWQfahdU/F2I/GRd3GyBfHBGq6IxLwkl3dyw4/+Sa8DCuaC85ZJrYBXlFF3WXXrmqFCj
         R0Ks8dGo159eH+N9llADqBZUTookOflMDTO8ynAByxCmzbzGT7M92E24ZJ25JRkQIu08
         P1WZ3CGxDOtRdDjIIXmzrzvKMBu9fIGns3KTBDc2SXpRMXmQIi9wgii7rFvMiDtjGGQe
         hPo6fhBVKXrvluMp5BeWczNIIGulGAMZn/SrBpxTvySjY7i3foCaJ5agKc9posdTkRaa
         he8g==
X-Forwarded-Encrypted: i=1; AHgh+RrXE3liuyIEmMq2yMQysh3YaBa1y1DhSrtx84VWXbd0vviH9dPW6+rG3g5a9PovxuiBjVIIBv1RldxCtA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb9xrJUWMgK981Yu8xzdyhzTGMnPFLOEujcKr67+WpXm+59B2g
	yGCGyTItqfju7JW5XMaoGrg5Ya4673iYNT+aFAnoPb48FniwN04vhgYkP7B/FW6WfRtqWWZF3Cw
	rEckIaroa5hNkRhExtbLOMUMslRDRmg8pittv8Tra
X-Gm-Gg: AfdE7cmzpgz86LXwMTl5dZZlSogFLv+aNV0l2bOiHoDaCyndgZ8mzuTOqZqae7sIh3R
	eBN0LrMw253SvNDTMO4k/4kMI9nobaBg7hvL+yr4XBJUlaVa6YHmhQVZEdgTcMbLuG2PePAr8lY
	B2SL1RppnnYSLd/tHmOc8z9G941JdfSqF507v5EFCMVR8Zdh/K3kBC68D/0+vvupqQllA/m93gc
	4TxO7w6Hay9YRbmN6bEHre7BHZhhCjC8ZcEQxKRy4NotW2C05r581sFIn1oIrxbBt1YLqTE
X-Received: by 2002:a05:6a20:4308:b0:3ba:cd5b:3dc8 with SMTP id
 adf61e73a8af0-3c36c1f1e9dmr3992057637.31.1784139193430; Wed, 15 Jul 2026
 11:13:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715174737.15287-1-matt@ozlabs.org>
In-Reply-To: <20260715174737.15287-1-matt@ozlabs.org>
From: David Matlack <dmatlack@google.com>
Date: Wed, 15 Jul 2026 11:12:46 -0700
X-Gm-Features: AUfX_myjzByVJrMRsslJCPDuFhCRYahAX-J5d0Fnwjil213_UwTGXzV50T-Uvqc
Message-ID: <CALzav=fH7N+ionUnELqw5ZaGrPmgp_w6kxoCtoY8fMmZY_S4zw@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] vfio/pci: Add mmap() for DMABUFs
To: Matt Evans <matt@ozlabs.org>
Cc: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Alex Mastro <amastro@fb.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>, 
	Kevin Tian <kevin.tian@intel.com>, Pranjal Shrivastava <praan@google.com>, 
	Longfang Liu <liulongfang@huawei.com>, Mahmoud Adam <mngyadam@amazon.de>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Ankit Agrawal <ankita@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	kvm@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 10:47=E2=80=AFAM Matt Evans <matt@ozlabs.org> wrote=
:

> This is based on v7.2-rc3.
>
> These commits are on GitHub for easier browsing, along with
> "[RFC ONLY] selftests: vfio: Add standalone vfio_dmabuf_mmap_test":
>
> https://github.com/metamev/linux/compare/v7.2-rc3...dev/mev/vfio-dmabuf-m=
map-v5

It'd be great to have this test upstream. I'm happy to review it when
you're ready. Looks like it just needs to be redone to use the VFIO
selftests library and kselftests harness. AI could probably do the
conversion pretty quick :)
