Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC5F3CEB99
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 15:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487822; cv=none; b=qd6Tv9Ks73e1xdzNh/0G9/BazwooY9+Xc34uyl1juMvsJ5jQ6VgY/F1f9LBKqis84+Ac58BA7sYRV/DBoSAxRlQcjmB1OgtTWGEaMn+QZpZYqsTKCNylZJElEKLtrIHbhkuC15ui+WsSVf1dqqny/1zRGwxOniCo+9kLGPX5BjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487822; c=relaxed/simple;
	bh=QlBta+H5mNjq+dbHXbi+7XyTVzhQ/G0m8qgfcGULLxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PZxr3UIF9iYX4UCnlsiiKcVVK3hsnfo6Jc/7Xy6hxeoC6TY23BPbH4/SxVN+e3Ifis90zXLDn5fEPcplKyQskcDeLlxRG3Tz3oQ1X4HGmoDctG4EIY3h3ae8lLkiPAUd1ZxxUaYgcW4sfSJc0FJ5aN2zvhw2IN7WaumGv3MlHYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E5nh0Qox; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E5nh0Qox"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24afso2826652a91.3
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 08:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789487820; x=1790092620; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SNucMVkd678hHS4QioCaDYebjQk2vtrspVRirogiq3E=;
        b=E5nh0Qox0Rp+e/ILwvLVNvUZQtclgeJytWGBcb7hNfzdDs2Jko71mjvvqJfPb9MjvC
         U1xHojW3K8s41C17fgavMMnx1mFDLqnRauZ3YKBMFT7UFF6F23R2qkYjn8ruhHhOjESc
         1s2sYAbLN/ggtrOMjSRCUXzEM0faCi0M6RGxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789487820; x=1790092620;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SNucMVkd678hHS4QioCaDYebjQk2vtrspVRirogiq3E=;
        b=XHLvEjeOHwC8AgDE94l0rTgPzgYx7rDyhG9Eql6+qWmBKPdzlgSMu/VOG6HW76n3bb
         AlUc2AYAYMKBFxhxER7P6q5Yni1r28vDi42PRxUlN+Assed7AwbgwvQAbJVOSVx/yasJ
         DoCd9XER2jYiv5Urn6RVhe5ixc0DRPDom1uVC4jbTwkTSdh9jI1QikNFPCXNqzfjevZc
         KPsvCiVZomtj9xQH6Y1Bc+hRwvUbf/wHTCIM7P9dU3OHFIGxmKlgk4vmAZsRktIEe/Hy
         IrG8juvzAE25FVrHFwn6vdIDZQyHtRuLyBu8dbF3FKE2Pj47I9O47G2BEdQTXhmYZtD2
         gc4w==
X-Forwarded-Encrypted: i=1; AKwUvBzmPbQrUTja6KFllPz8AW9BQXXdNvgE9zeUmDHmjy4y6lEmT9SpelYm0wo7cnyDCZWqfpoE+vIZUT/RRA==@vger.kernel.org
X-Gm-Message-State: AFuF++mAqZ7rffY4P+Ma1QLJDWIBcsGlXe/nRmZ+yvXHLDy6l7ofJPZn
	d7MIwu5If1glbsvYPOwD8Lb2l0kGOmJgWgc7Jp8iodqpOO2hS5dHMSZKEhxCDbuU97Zmx+/UNvY
	Ad5E=
X-Gm-Gg: AYBFou3v1wjBc4C5SjhxaoclZykHzZ+lZ9DCT1iDnqK9FxOwxdGWwtgY/Bt4dc678Du
	XsuWXGniEPkii+t9wJ2MDmtCo/eThJpn45t+aSdtZIoyFi1JRQVhj8c+5M7JWsz1MORTN8UsoFu
	hUl17tajwp5uniHz7d/qvYmN8MEAi+l11eaUMihHJmvIHA5fEAB2D07uGMXZVwMiXsS8tSLYqOC
	66vZ+Hvo5ldkBkc3OVYZWcDCYvBdnTx/SbDeeBGoHJ990esN0A81n9CgQeYDUX8+uKhs7tqrtFy
	EjjwHBGVmveXfgnzzuApaTHCCYCNbvj7LsLYpIMfnxaL/tAQ7CxAp2I+uGB5NpaiPCzUKyYiIDS
	USoes6WDuQ2msSLi3cdnhBmD8rNJpqZpFZgO5y4laYWiyR7Ros0Cull+KwTvHeykbME2PPmGw8B
	pzeO7DMOUDSq9rp6e22GuTHHG9dELLD4o46dJ5a6jym6oYBPpJLA5P15cg72y6rrG6gr9TsmJl1
	gXTGUCXu4DR6B9zs77WR91ASXtHkracTxUf
X-Received: by 2002:a17:90b:534c:b0:39d:f08e:e6e7 with SMTP id 98e67ed59e1d1-39df08f09b2mr16449735a91.9.1789487819769;
        Tue, 15 Sep 2026 08:56:59 -0700 (PDT)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com. [74.125.228.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdb3045bsm7064396a91.17.2026.09.15.08.56.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 08:56:59 -0700 (PDT)
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e25187so2646949b3a.2
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 08:56:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwWmmBVoYTHBJlrcxKonCGrkffehOOYAnlraRgHmgthYJWEgfHfTufL0beK7R0DS7yzKzx4MT3Z+y3tew==@vger.kernel.org
X-Received: by 2002:a05:6a21:3315:b0:3cc:3d08:da2b with SMTP id
 adf61e73a8af0-3db405ca519mr21103752637.15.1789487816474; Tue, 15 Sep 2026
 08:56:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <apqGlTiybdvQX3Ao@kekkonen.localdomain> <eff6fe78-cc4b-4192-93ed-53a738fc3c3a@gmail.com>
 <aqU5QFGmYlCtbdiE@kekkonen.localdomain> <CANiDSCv=cwm=aHLfO_ccPfc-XyK3gS8Y+8DZpbb3gcXX0n8mqQ@mail.gmail.com>
 <aqfyYSagcejWb4xD@stanley.mountain>
In-Reply-To: <aqfyYSagcejWb4xD@stanley.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 15 Sep 2026 17:56:43 +0200
X-Gmail-Original-Message-ID: <CANiDSCtEmAZippX45kaxjWAHs+cd+vpFFtxOnnz00nmVnkgqzQ@mail.gmail.com>
X-Gm-Features: AcwNN1VOeS6uL0_wTY-nR6d_j0OJAaYWMrSrW2geaFCqxnwzMq5M1mnIaCQWjMI
Message-ID: <CANiDSCtEmAZippX45kaxjWAHs+cd+vpFFtxOnnz00nmVnkgqzQ@mail.gmail.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Dan Carpenter <error27@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Ceclan Dumitru <mitrutzceclan@gmail.com>, 
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

Hi Dan, Hi Sakari

On Mon, 14 Sept 2026 at 15:11, Dan Carpenter <error27@gmail.com> wrote:
>
> On Mon, Sep 14, 2026 at 02:10:10PM +0200, Ricardo Ribalda wrote:
> > Hi Sakari
> >
> > On Sat, 12 Sept 2026 at 13:36, Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Dumitru, Dan, Ricardo,
> > >
> > > On Tue, Sep 08, 2026 at 01:35:05PM +0300, Ceclan Dumitru wrote:
> > > > > Can you check this
> > > > > <URL:https://linux-media.pages.freedesktop.org/-/users/sailus/-/jobs/109521830/artifacts/junit/test-smatch.log.txt>
> > > > > please? If there's a single patch that needs to be modified, I can squash a
> > > > > patch into that, otherwise v17 it is.
> > > > >
> > > >
> > > > These are the same warns reported by Niklas in V13. Dan fixed them in
> > > > smatch in devel branch but fix is not in master. Testing with smatch on
> > > > that branch yields no warnings.
> > >
> > > Dan: any plans to merge these things to master some time soon? Or:
> > >
> > > Ricardo: could we use devel branch of smatch for some time?
> >
> > Do you know what patch fixes it? If it is easy to cherry pick I can
> > add it to our list of smatch patches
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/third_party?ref_type=heads
> >
>
> Commit d12183645a31 ("precedence: silence some false positives")
>
> Sorry, I felt like I was close to merging devel but then I started
> another major surgery to the core and got stuck.

Thanks for the pointer. I have added the patch to media-ci
https://gitlab.freedesktop.org/linux-media/media-ci/-/merge_requests/351

Now that I have your attention ... :P

May I ask you to look int
https://lore.kernel.org/all/20260914-unqual-v2-0-60a1407a0cd4@chromium.org/
in case you have missed it?

Thanks a lot!


>
> regards,
> dan carpenter
>
>


-- 
Ricardo Ribalda
