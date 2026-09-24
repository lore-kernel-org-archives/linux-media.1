Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CE74A2A6F
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 15:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790264544; cv=pass; b=XzYo1Rpw5jxHJ6JDLRRIZ4oaYxAtSvA1cYAe2zZUR+n0dFoPio+LWTZlOTma6nubwzGZiaYXbFu4spH/qNIEojC9aOPLDwBPs7r1q4opBjkVaS3W3Y7kTzb7kp4CAsCwrD3bu1fGacjkWfkp/eQ0m7boQj3I0TrCWSOFn3jFVuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790264544; c=relaxed/simple;
	bh=PyIrnipvkBWRV4hHOpoG3qPK65aPl0bzHYIyrKbgTzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zji3/6zSns/Z1uG+1SGH3hQR3DY9JuB+7A6CwZHmuy2Do2b3b/SbOaudZ2M0VnUWDc1cR/xoLsWYSjMM1g97PC7at6QuJAImNesQLJJKx7e8ydEdJjaa6NOG7V1Cm+WJjviTg60WJptQNDRNkB3qQxKkuTZe71iddBY4hNBWjuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N5nJqjG+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iHP9rRsc; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N5nJqjG+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iHP9rRsc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790264541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/64YUvNMf9EIe8aZXp3DzyY+LbONkg5uQf4LZYgGwC0=;
	b=N5nJqjG+CCqiKOUMIy+cAq9Ow0QOH/g8y7qkqripLHY+xA52Ulvj6QjC4UgfhNAE8f/NTQ
	ERP4l6jY5/34bDLO8j/YOXLeTbisjpqVsIkISSyPKLuKvnUmIF7dbd50s+oyMss6RvkYIO
	Gvg68S8FqYiBPUh24USVfCB6mx3/9Ew=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-oLIRiIBLNp2F4Mp1Q1WmWA-1; Thu, 24 Sep 2026 11:42:20 -0400
X-MC-Unique: oLIRiIBLNp2F4Mp1Q1WmWA-1
X-Mimecast-MFC-AGG-ID: oLIRiIBLNp2F4Mp1Q1WmWA_1790264540
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-892be308686so41801067b3.0
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 08:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790264540; cv=none;
        d=google.com; s=arc-20260327;
        b=QOHMMY9g7PV2OqvxbftFcCyCxb6lfBZHzPyPRCG1xAPaWXrLoLpzgLzWk2zYrhyTX4
         2q+2Iii65wbODhUy35rZZ5am05LZYg6Z2YNISUV3PKm2M/1KVEwiC5juzGT2iow0D49J
         e0AQGt5GC9LT5Vy6C74gtylby+hjzKd7XQGa3SzQcTNR5b+3X8f0XNDTj5f5EUSLUUwX
         OQANJo2sQCXuFzE8wTNYTe+MpRl7e0dJszVQclPDyMVNamDkgE2KB9zLlFXcDHyPB+O7
         5WlytOj7BJe5G/1enpLuQH0mCkKiWyDu75pzOBn5bi8+mbrwUbZ7Z3ASjNrU1ykg2tdn
         fAYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/64YUvNMf9EIe8aZXp3DzyY+LbONkg5uQf4LZYgGwC0=;
        fh=GQseYFpsk7JZ2hrrdbiUU8wI/nJUxB3OsEhT6u/TbwY=;
        b=ovLCZY6ORIQZcGrf1C6rlfnIwmcd6G2gBvWYbWV8VsSU6GJ8S9jxI/7XhAlDhcgXNe
         vT/1eWFPf3P9hsfWKybZgo2RDiGrx/zjr6rG1hGVko94e4kOMn6AsSd6a2ldDG8pN2DF
         nkIkxjuYCuXjMnFwDmCF7jw81hBgfHu4MPckj5VogHg6iTQ8LWXYV1cQwprNbkeGj5Tk
         OIs4C1Ij8QIMZQ2TGtWm+DJeQMBAmpOCHD/5hU46io+Le39Xn3mHZNDEJ+ojRv+MyST0
         C1Ko9RWhQrOci91ALxpDD9w55K1aslqE5FV1QYi98C+CeE2JuQHdcAtgZ2i29ceEFZqN
         LAzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790264540; x=1790869340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/64YUvNMf9EIe8aZXp3DzyY+LbONkg5uQf4LZYgGwC0=;
        b=iHP9rRscuc4sxMcvl5DWWEp25u86FylzdIZSyCvGOb8EVKcNesNUY9MtRCDoabjcQa
         wIpdPs0kpGAuj4O4to9lKS6KU6r+ZN4JIpmGcwkAf5nOvJ98GtvKJDbet/kSPzFDP4VW
         5Sp5fIMTSYCcwhEI1QJfkZ7/VNS5Yk3rL+1mvdVHmjqocKMe4R0SbDO/j59pxfZYXvhW
         bDITEEu5don7p8S1jMKauQiNkg/j0VVqLMf4UQl9MOs1vnCP6qqBe6DtEzSsihRvTuCV
         rzcFnO/M8nngiLddk0R9tT6xgaxNr+Ej026YHSF+WmBT+vp+r+WKef5M99aUCENXGpic
         oOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790264540; x=1790869340;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/64YUvNMf9EIe8aZXp3DzyY+LbONkg5uQf4LZYgGwC0=;
        b=b/jLoVNeaolnoLPIQGaqXtztdOAd5P5BGV9Jp5oTlYwvkEKJbfNxtZNZcWpUSy2sfq
         Zs56kb6JDSkT6yZdpL/umyUji3yGMZxox4gWDPzTNsLy9/9ooouQD8HNSVyT11YQowHp
         Pl3bQ84U5vfdIDznT3vj1hRt1SI05eoqToadNoEPwE8moeleAFhqaDHKb+dalgPVSTRc
         wUbNMNeupp1iMVxwDaOif5BPs/e7hbVZpy2uoe7uNRZH9jYPzgp3bq02Jm4CQdWDio/U
         HWU3HORpTNeuREYGjFK9KsunR3NBFVDU3+LCNzjvfq9NkSW0197RY5sN6mND1EB7110a
         sOVA==
X-Forwarded-Encrypted: i=1; AKwUvByQDzqxnkEflvoZPsUoS5Q3XacZXDTMQ8u/PfG4xZaDH/CHFiXpIMeXHzsPdY2Ghta//vnyyR14fL68KA==@vger.kernel.org
X-Gm-Message-State: AFuF++kpS/6nWmZqLIVYGRLDGaOsprRGGZs1VOMztA1gau2Bh3ZcInQk
	t56jvzGZ+40raT37Z7iyKTvlgSkfyt9wYOg7i9HoGxc4sYcnNdPZ7bn1UI/Gpdzd3u/52EWUzIG
	dAwzBz9jPHqtpWoZBqvFRyinaKa1GT0l7VIlig8r3SK8uj3VcG9jx96nk7+aSDphdZdYeREBMgl
	pVb3DsIRVJguGMKtc5nREKjpzO4Y8umCpOk1HN66o=
X-Gm-Gg: AYBFou2vsuZ0YW1rK8cN/V+idL43vDchA86QAUw+mRLmgUZ/3eNGn/jUzVPISFCPaIe
	Tj0lTNfTPwKa3ZAsZOJPyvxxQxmqhBPl1DRZ3+5jVpwDS2E2RjvCJNjrJUbSj95ltQaH2MNn825
	Nwuti1P75QnjnEYmV0eWlHF/i898h0hmTBp4NhqG2O0B5O+xU5e5wvXA==
X-Received: by 2002:a05:690c:6e87:b0:8a7:91f8:1e8d with SMTP id 00721157ae682-8a791f82a3bmr9357807b3.53.1790264539020;
        Thu, 24 Sep 2026 08:42:19 -0700 (PDT)
X-Received: by 2002:a05:690c:6e87:b0:8a7:91f8:1e8d with SMTP id
 00721157ae682-8a791f82a3bmr9357067b3.53.1790264538368; Thu, 24 Sep 2026
 08:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-scm-device-api-v1-0-3573e2596c51@redhat.com>
 <bRb6NzJiFvNGB0X3BeiVytgZNlRv88LFlcaBwwFIFa3GtVZhn5bh9EoRRDliRtgsnlQNMddvcIPK-5HK9x7z9Q==@protonmail.internalid>
 <20260914-scm-device-api-v1-2-3573e2596c51@redhat.com> <49153dff-b4e0-43ac-aa82-15175fea6445@kernel.org>
In-Reply-To: <49153dff-b4e0-43ac-aa82-15175fea6445@kernel.org>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 24 Sep 2026 17:42:05 +0200
X-Gm-Features: AclHuK8NibWpN40MLtS8tk1TsaU8ZJKSI8cLr02zuHOUyaXDRMTCkw3xFezOa38
Message-ID: <CADSE00JcFOY0r6doD1Qpc0xtZ6HKsa4kFGsV0_FsNbb+yemmKg@mail.gmail.com>
Subject: Re: [PATCH 2/3] firmware: qcom: scm: pass qcom_scm through the
 exported API
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

On Wed, Sep 23, 2026 at 11:08=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> =
wrote:
>
> On 14/09/2026 13:41, Albert Esteve wrote:
> >   static int spm_cpuidle_drv_probe(struct platform_device *pdev)
> >   {
> > +     struct qcom_scm *scm =3D qcom_scm_get();
> >       int cpu, ret;
> >
> > -     if (!qcom_scm_is_available())
> > +     if (!scm)
> >               return -EPROBE_DEFER;
>
> Is this equivalent code ?
>
> Its also a bit confusing to me that the next patch adds a .available
> field to the qcom_scm struct.

I can see how this can be confusing. The problem with
qcom_scm_is_available(scm) is that callers did not have an SCM handle
yet. So drivers needed to search for it beforehand. Once I had to
repeat that a few times, I instead added qcom_scm_get(), which looks
up the bound instance and returns NULL if it is not ready (and still
uses qcom_scm_is_available() internally). So, !scm is the same check
as before, while we obtain the pointer for the following calls.

scm->available in the following patch replaces the __scm publication
flag when the global is removed. Until then, readiness is still based
on the static __scm validity.

>
> I see where you do get drvdata but I haven't managed to find in the
> series where the data gets set - haven't asked an LLM either - I think
> the logic to associate the scm pointer and get it should live together
> in one patch so that the logic is easier to find and reason about.

platform_set_drvdata() is already in qcom_scm_probe(); this series
only adds the dev_get_drvdata() / qcom_scm_get() lookups. I can
clarify this in the commit message so the set/get pairing is more
obvious.

BR,
Albert

>
> ---
> bod
>

