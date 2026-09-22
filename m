Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD3124E016
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 11:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790076797; cv=none; b=bA93lWm14ltyGu9pz4VEso2aTDSO1K/IK5zEyV4CeQHppjXsjZSyqk1PYjgXfEF1P5i0ltPAgzZ992vBEw8TMfn/bATDZzY6Q/H5ROC6CVvjesSO6b1sRP+qjDvmrqAItg2fq/8SBiAF20dIDKRb6JKmmAQhYsZnh9CK4SMveGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790076797; c=relaxed/simple;
	bh=vAqHJkJK8NybKzUEyFkNm7wHMeyR870vyueLoGzt3yE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gGQkvlSlmyngTVnewSsHIYkEvQ1qgT4ZfhS8eQJah2ogmA4h/vMRuGyo+Wc4WhoiQPb20azwPJu38x+PArkOxekwfvaRf+qzAqXRF6B50bRXTGDhDKficbErFAtXYbNwy12Wi+jQQpSJy1tY2P2kaguQTN8uRiDXPwi4q1NG1Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ErGNUSgi; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ErGNUSgi"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc515bef69dso2636052a12.2
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 04:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790076792; x=1790681592; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fSk3TeVnQVuy0Nz0PmBxSCcv2Duz1teV8o735BciAQA=;
        b=ErGNUSgi2MhgMyDMjtDVVexgYwceHiiENTDdsMMRp58BbzshXjUz04+6jeBvq6kprL
         HCCKO8Wi9Ejel+IeivQYEczNbOUDNhLHAJ+XbVa9VPfP62GbeZK79xRF1W8TqiyDR6ym
         kPhX8TKnw+HDsM3CCLiaBwbJsPUwzjR0bsbNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790076792; x=1790681592;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fSk3TeVnQVuy0Nz0PmBxSCcv2Duz1teV8o735BciAQA=;
        b=K9o9Synn1T/ItyKDggnYsM5vISdkB55xsSXWW60Lc/BV6/t89PO7bqFduP5GE9LPkp
         7iZ7Pu60F+Sh7EENweBAtazvhfX9wftEb5OWQIJs5VO3REMXGlrUpE/G/ePa/nNdEKo/
         6B87//nXcsrQHJ4S8VRuCEGNreWNdpXbb0Y7VaENuqD/QquyeAo6hoTATceQ9hDlMxus
         F8JeJv9rQwOFfdGQOxau7unCvSQdlJg22yAh2tQrouUnmuhRtqxKM19984IeAjYHWtzx
         j7qawWRQufKd0MzbyBGKbJfRSacSWUU0d6iLVVV6B6ak69WkQ0L59j7YE7b4/zrwhlP3
         SvpA==
X-Forwarded-Encrypted: i=1; AKwUvBy5Oov+iU6UnfgP8noQNzAeH9bwQzxRPBa6usqD3VnQYT6jN3QYcAqL1PIfdOmvYdSRM7BWk52cg3LZSg==@vger.kernel.org
X-Gm-Message-State: AFuF++mhP+xmXwDqgEtqQYcnrsxtSZqgkV6vktyTw+5gWnc9J1P/BRry
	kEICz+RgoWuAsQi8nvyH2TT7bBdMbNOTEpiyob8Faim1Wl9Gk24D4VHBnh/E4WoquXk0f2epUdC
	mi+ohZw==
X-Gm-Gg: AYBFou26vaoZUGdgelAj41MfeENQMe9IFRmbfG6X6ocK6t2HBbBdykVz1LxzObeKppO
	tCKTiUcmu0rjay3ed8q7RJfIDbiQwMDqbVsc/GPZ/9xNTPmRZA2m6XkL51y//aNYh6TeB/New52
	zCh5NoCwCENHngANZDsmnqin75meTvwOoyanrcGowq/GfmnuvC/z/1ml9RIlzc9+rXG46Dbwvqk
	NvlOHD4vi0l23zTrnKgJnG3ZwClLE52UG2ktN48qasY0Qc50YMHZMc3aCyWP33yep/61EbZwAe3
	MZfH3G7k2SRXN0rq9SrDi5bS93zGN04By9C4C1JAJ7JerKA0LCikAxNDDqO8YkHzq3aDS5+S7FG
	3xiNoJkptJ6Ig6znttETfi95Q2PATY2eyhXKP2ljyqSXUb5K9LbNVrHZfYXCtfoNyVkDxczmvXq
	R2HuyLRGNod/xikCx2+E86Dt7kGJugHrqilNhaS4vmXR0Jpn7pHswb+J07gDufZTtmcnB03f8dv
	89JJtjKOCYy4w2xzIOtluNKehgDoyc9SiJl
X-Received: by 2002:a17:90b:4e:b0:39e:6c6a:2099 with SMTP id 98e67ed59e1d1-3a073284adamr964797a91.58.1790076791093;
        Tue, 22 Sep 2026 04:33:11 -0700 (PDT)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com. [74.125.228.12])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06e5a5f6esm3014169a91.12.2026.09.22.04.33.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 04:33:10 -0700 (PDT)
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4c7a0so2213660a12.1
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 04:33:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBysM78kXMQAx5ELtrcJUmFvQM07vhnN2dvF9FpBvYlBfug7dPx2xA3JQbMw93tN2bCFpkzvuO82esp76g==@vger.kernel.org
X-Received: by 2002:a17:90a:e183:b0:39e:6c6a:209b with SMTP id
 98e67ed59e1d1-3a0732aab47mr857626a91.60.1790076789532; Tue, 22 Sep 2026
 04:33:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <apqGlTiybdvQX3Ao@kekkonen.localdomain> <eff6fe78-cc4b-4192-93ed-53a738fc3c3a@gmail.com>
 <aqU5QFGmYlCtbdiE@kekkonen.localdomain> <CANiDSCv=cwm=aHLfO_ccPfc-XyK3gS8Y+8DZpbb3gcXX0n8mqQ@mail.gmail.com>
 <aqfyYSagcejWb4xD@stanley.mountain> <CANiDSCtEmAZippX45kaxjWAHs+cd+vpFFtxOnnz00nmVnkgqzQ@mail.gmail.com>
 <arJjxjiWVlnHhioR@kekkonen.localdomain>
In-Reply-To: <arJjxjiWVlnHhioR@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 22 Sep 2026 13:32:56 +0200
X-Gmail-Original-Message-ID: <CANiDSCsD_OO_7_ZQ0NvWHXRN4jo2Aqr-XGZamn3bCzwnZ6gmZQ@mail.gmail.com>
X-Gm-Features: AcwNN1XSEqnhRqXFFRQlQKzrgp_us5KopVV821iFq_cxHFRxG_Sd7N3TpS2PoSA
Message-ID: <CANiDSCsD_OO_7_ZQ0NvWHXRN4jo2Aqr-XGZamn3bCzwnZ6gmZQ@mail.gmail.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dan Carpenter <error27@gmail.com>, Ceclan Dumitru <mitrutzceclan@gmail.com>, 
	dumitru.ceclan@analog.com, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Martin Hecht <Martin.Hecht@avnet.eu>, Andrian Suciu <Adrian.Suciu@analog.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Vivekananda Dayananda <vivekana@amd.com>, Cory Keitz <ckeitz@amazon.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 13:17, Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Ricardo, Dan,
>
> On Tue, Sep 15, 2026 at 05:56:43PM +0200, Ricardo Ribalda wrote:
> > Hi Dan, Hi Sakari
> >
> > On Mon, 14 Sept 2026 at 15:11, Dan Carpenter <error27@gmail.com> wrote:
> > >
> > > On Mon, Sep 14, 2026 at 02:10:10PM +0200, Ricardo Ribalda wrote:
> > > > Hi Sakari
> > > >
> > > > On Sat, 12 Sept 2026 at 13:36, Sakari Ailus
> > > > <sakari.ailus@linux.intel.com> wrote:
> > > > >
> > > > > Hi Dumitru, Dan, Ricardo,
> > > > >
> > > > > On Tue, Sep 08, 2026 at 01:35:05PM +0300, Ceclan Dumitru wrote:
> > > > > > > Can you check this
> > > > > > > <URL:https://linux-media.pages.freedesktop.org/-/users/sailus/-/jobs/109521830/artifacts/junit/test-smatch.log.txt>
> > > > > > > please? If there's a single patch that needs to be modified, I can squash a
> > > > > > > patch into that, otherwise v17 it is.
> > > > > > >
> > > > > >
> > > > > > These are the same warns reported by Niklas in V13. Dan fixed them in
> > > > > > smatch in devel branch but fix is not in master. Testing with smatch on
> > > > > > that branch yields no warnings.
> > > > >
> > > > > Dan: any plans to merge these things to master some time soon? Or:
> > > > >
> > > > > Ricardo: could we use devel branch of smatch for some time?
> > > >
> > > > Do you know what patch fixes it? If it is easy to cherry pick I can
> > > > add it to our list of smatch patches
> > > > https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/third_party?ref_type=heads
> > > >
> > >
> > > Commit d12183645a31 ("precedence: silence some false positives")
> > >
> > > Sorry, I felt like I was close to merging devel but then I started
> > > another major surgery to the core and got stuck.
> >
> > Thanks for the pointer. I have added the patch to media-ci
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/merge_requests/351
> >
> > Now that I have your attention ... :P
> >
> > May I ask you to look int
> > https://lore.kernel.org/all/20260914-unqual-v2-0-60a1407a0cd4@chromium.org/
> > in case you have missed it?
>
> I understand the required commit is there and I tried to push the Maxim
> serdes driver again but I'm still getting
> <URL:https://gitlab.freedesktop.org/linux-media/users/sailus/-/jobs/110822240/artifacts/file/junit/test-smatch.log.txt>.
>
> I wonder if we could have the devel branch there or some more commits...?

I managed to reproduce it also in my computer, so I do not think that
it is an issue in media-ci.

I would prefer using only tagged versions in media-ci.

Dan, how far are you from making a release?

>
> --
> Regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda
