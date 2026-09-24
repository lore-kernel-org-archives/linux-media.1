Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B6049F129
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 15:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262045; cv=pass; b=XfrWx0w+fDveyJEnrsfMduwVPFEGsQD61EtFNRpk+xyMMvY6Vm8LYxHGYXXFVUg3dw7rVH822RnvwqbOsd7FYqFYuvKH65POWtualR3mmEBPloyP2HaU+6DWOck6LBC5cGruPFeCtpUf0o/dj5YR6YA6ATEk4LXsBckQUhalpFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262045; c=relaxed/simple;
	bh=iuUfA02SH2tSSicml2K0I3xqm9pZO7ThoY25b+dKE6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JnDJT+bVdTFFw6ztg4a38MoiN7SKcGPn5kJvSNp9eLJ2a9XLM70ntP6/M85KuUkh0ltg4qCw2x6GJCI0qSv62fjRsh8OA5RM366ZtfwhhJjr1Z4AVon2MhCealUNeWtnWwwzokXvcJXRmN9allR+JD6+N1+Z731hjmotK2VSny0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h/tUKF+G; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MVDl+InI; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h/tUKF+G";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MVDl+InI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790262042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YKTy1DV5Z8HP/0nQigR4wkQdWVD6m+LzXDtQhSwKE3c=;
	b=h/tUKF+GjUa0Y1mVfe+yVQYzqWASfzm5/7k9EnciidAxox34sO54UF/voll/xmfgUGq8aH
	2EuBMW79l/Z623eXVcIWgACtfc3pUpSLhU2X0CCIjiSoAnZNr0R9gBnRC0wKqcY3lHBoz7
	YK/Z34l3bpo15gnKhX3liV6LGOef2uo=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-lsZ5kuTVNHuUj8-oL9i4wg-1; Thu, 24 Sep 2026 11:00:40 -0400
X-MC-Unique: lsZ5kuTVNHuUj8-oL9i4wg-1
X-Mimecast-MFC-AGG-ID: lsZ5kuTVNHuUj8-oL9i4wg_1790262040
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8461ade272bso18335857b3.1
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 08:00:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790262040; cv=none;
        d=google.com; s=arc-20260327;
        b=DVgB/aeuPqBC9NQuM0kclvWLyg/StJ3rJkT4MFaWz6CQIOIBu9JnD6N1IsSOGeG03C
         yWEiHnlNDn0MvbliOTdPuRNk1rIkquLI8oJHh+9grPYVMbAlYRPc4sw/OaHG6LaCyK5a
         IQyUVMM1dP37E2rPwxodkJg0EIGbTMSeGbbvdsfscPwThLrCU2s2e72M1G2p7KzdCGm+
         OeQiuwnmWAX6+riRapwd+JJi+8NB+Ao4fFaL3rHafWIeq9zh4qnmSpayc4Q1CWchj9RZ
         IVFxOmjhPDha27bRte2x8WZD3NSseHyWbe8t/YtS70gvs06+slcOr2qHnoxdtAqwPBD5
         IC8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YKTy1DV5Z8HP/0nQigR4wkQdWVD6m+LzXDtQhSwKE3c=;
        fh=FGQu8MTO/p9/gXBAoNvBApUD+Nhv06pbAqyXhGWpyHs=;
        b=tDnLS6JFDYXt09wfVCnU5p14FaL9JxngiYRa2g8rviJX5g3N1FMJPtObueMyoCRj1t
         Wa8u2RKX/ybvr/Oosz6K/iSKQg6VWhBKHReVliGbsoaXmRHWnORrKBs8mAyTwpSwdXIv
         T8PEhmZwC82bKi3IK1ZcHtlMdHc4CYFcLp/sc0hJOyuM6gIVLz9/13Pg2/Uk2d+rA13j
         fTrc/YL4sPhemKyoz4euRBhRrbihlTKmc+F0uLEr3BDE3KtrM/8BoNpMuxj/4U3ZiAVI
         Y6sbMIscqNXdxwGelx5iCOzsQwovhGyxs0LPplZ9BoifOcJivYV5CQbjRpgdCLTi7qLa
         u5wA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790262040; x=1790866840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YKTy1DV5Z8HP/0nQigR4wkQdWVD6m+LzXDtQhSwKE3c=;
        b=MVDl+InINlRiSWNoJ+zSo3dPDLpLFAx8rHOQcJPrFcrb0dFjn331QV2IRGTQ7mSLf2
         FzOGnMoq9jW909FTyZADgpBVLgDHXWeUVGIDkPw+aeVry1O2IqecYbQhdHv53moD09Gd
         M6/R10IHRh/oSqPNOZRSalRoelc2p/FUbgk8NWsvk10oj8K0P0i/+6Kb2SJNz7+VGtS3
         EHiUnog1bSJUloT5Ezfcd6Fbhr/4NApXO579lYUqr0j5S8iaQ1FgRSVlUokp15A2kalc
         H92GZLmjxY5Dvm/8H/oqzwnBKNx9aSsXGI80NbQvadYeVqffYhdBjfmMsucgQUH6nslq
         hc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790262040; x=1790866840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YKTy1DV5Z8HP/0nQigR4wkQdWVD6m+LzXDtQhSwKE3c=;
        b=F8rf+Qo2SMDrMvIBZy6y63BPxAfnWhfdrJJ4/uI/iLR65TTs7ye6PHx12aYhkDLqs4
         N10nGQpzUH48mcciliWRKdMHCD03Ac6//1FQkLbanZp0NyQHFrz8j8gs7f3TpQALFqjY
         x2Y7JuGHomDrA2g82uzOFwTqq3ktfu6cdP/fsygSbc8g03ZU+rnelZ9+hdKHBx7sunff
         ECKj3DyEe3RlDjT4E9HeP2VJzbpt7NV4HqtEJuVc471zMIHjTPqrsSjbkUytGYlQWvw3
         fHhjjpnoDyXyLmHiUo5mY+m4o7nGV5HwfYs2j39KOxjo0q2ZEXM0Xm3Pr2bkjW0E4ly6
         aPqg==
X-Forwarded-Encrypted: i=1; AKwUvBw6XHJiIhhLHJwg+D1DqJBf2wn9XHc88PG/0BLUsePrExOrcltZRsATwbPTHM1GZAuskBFVT4ihWX+rJQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nJsaIJ/b5M6LjC2rqhDd8+2H21EzC6z9G7UzRY1xxboPORc4z2
	koWZB+QsAEnYztAZb2zN0hYUgjHglk6fZWiuBPqxMxeS0sJZWUDNsfUDJksxDqSkPi+GHtHbc0N
	QJ6r9/+tdcH8rCTwW7a1rAaojhWWgWdfHuB8ZV9jhLqCZRMmagjcOmVVCG0twiE8YAZE5CKCbZp
	guNQmUVdhE+lRCtWWqg02MdT6ddO+OrxwUWP/fbLs=
X-Gm-Gg: AYBFou1y7ND+pZeaXvcNtsywJPC82zxVT4Gem9vsNg6iMz0sMExW2Y0lRvMGBLFqeVv
	Eerd/bg0xFN1GryLailIzaAxBaSHy4IW/UdmtBQShJeknFbgGCf7diSJDJmwQZuyqPWazWoL/wW
	T3mPbLXUgc7BLfB/TkkHrm+M6Fbzk3sn1AEf/r95OkD2My3vnGhi7aGw==
X-Received: by 2002:a05:690c:f04:b0:8a4:af43:6941 with SMTP id 00721157ae682-8a64e5d7328mr16132417b3.20.1790262039834;
        Thu, 24 Sep 2026 08:00:39 -0700 (PDT)
X-Received: by 2002:a05:690c:f04:b0:8a4:af43:6941 with SMTP id
 00721157ae682-8a64e5d7328mr16131377b3.20.1790262038827; Thu, 24 Sep 2026
 08:00:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-scm-device-api-v1-0-3573e2596c51@redhat.com>
 <EKwbCgCnxbNX4p95qJ3xoytzeNBBLc2L_HOVWr-S-y8n7pNOIToj37TyoXRcLyIK1gjq_IvbreQ331gw6jIK9Q==@protonmail.internalid>
 <20260914-scm-device-api-v1-1-3573e2596c51@redhat.com> <b1340496-1ff3-4ad7-87c3-36d2162efbfa@kernel.org>
In-Reply-To: <b1340496-1ff3-4ad7-87c3-36d2162efbfa@kernel.org>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 24 Sep 2026 17:00:27 +0200
X-Gm-Features: AclHuK_S1nrFMWot6v8DC6klfULfaNk07isgmJtfP7BYAekyrR84kzWx2Uw9qhE
Message-ID: <CADSE00JhFYhDV2cuVxZwVTX6LTe8zH0-BR=-Fhv+6UXeFxq_Zw@mail.gmail.com>
Subject: Re: [PATCH 1/3] firmware: qcom: scm: pass qcom_scm to internal helpers
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, Jens Wiklander <jenswi@kernel.org>, 
	Sumit Garg <sumit.garg@kernel.org>, Amit Kucheria <amitk@kernel.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Brian Norris <briannorris@chromium.org>, 
	Govind Singh <govinds@codeaurora.org>, Niklas Cassel <niklas.cassel@linaro.org>, 
	Kalle Valo <kvalo@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, iommu@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 11:00=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> =
wrote:
>
> On 14/09/2026 13:41, Albert Esteve wrote:
> >   int qcom_scm_pas_auth_and_reset(u32 pas_id)
> >   {
> > -     return __qcom_scm_pas_auth_and_reset(__scm->dev, pas_id);
> > +     struct qcom_scm *scm =3D __scm;
> > +
> > +     return __qcom_scm_pas_auth_and_reset(scm->dev, pas_id);
> >   }
> >   EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
>
> Why make this change at all though ?
>
> It takes a pointer to the file static _scm
>
> The reset of the patch looks straight-forward to me but this change
> caught my eye.

Yeah, this change isn't useful. I aimed to avoid passing __scm to
function calls but it does nothing in this patch, it'd be better to
change it directly in the next patch that changes the signature.

BR,
Albert

>
> ---
> bod
>

