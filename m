Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C83350D74
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 18:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780598947; cv=none; b=F8rzFP6MYc0JH0ew/BqJcaVm4K/ZK7xmMNd92NELbL/jHFZqcTgmMWCsBQIXQth6+16OGDyk8q+Xvwu6qYxwDeOf97TFkgLyLuoKEO7WfSBaCyXtA/EtCu3Av8S83blb+29vmGga31OfWO8iqQd6567WImLhytm47/py6jkiSXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780598947; c=relaxed/simple;
	bh=bSOB8kwgdkJuUcuvvGWTTy+0BwGIhrEyhn+sNY27Rlk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WoSzesCX3WmgkGsoow0CB+dfDAMOFxbujd9uYVAjR5EI7lJlI4SfZpDL5U36qBEzkDw2g6qgPjvPs6Nd4WxNDtvFT92i8zXx8uWnLfZEZFs/yV0eFfXVZpA/m5AodCLpRlOoxQaphJTXzm4wUfbXq4/g3liws8MpFIyLRR/HYQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GcvyWR7i; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nE4/14Nk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GcvyWR7i";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nE4/14Nk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780598943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bSOB8kwgdkJuUcuvvGWTTy+0BwGIhrEyhn+sNY27Rlk=;
	b=GcvyWR7iFl75XWuSMj9LajJ257Fa55LDbeN3JMhhw60J43hcdjPz4Y/X7cABbtaG5vz7zO
	b+w+g/mkTIctKpaW4Cs9slu4F+dSNC8rw46HnAl9KnKa39yN9t4fVPXEfg4/pj+M1osGyw
	QGsL9GnP90+0kJs2AeDif4uxdVoPfTs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-fxU4gHc3NHapuGLOI5zabg-1; Thu, 04 Jun 2026 14:49:02 -0400
X-MC-Unique: fxU4gHc3NHapuGLOI5zabg-1
X-Mimecast-MFC-AGG-ID: fxU4gHc3NHapuGLOI5zabg_1780598942
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8cceb5a9686so5761486d6.0
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 11:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780598942; x=1781203742; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bSOB8kwgdkJuUcuvvGWTTy+0BwGIhrEyhn+sNY27Rlk=;
        b=nE4/14Nk1qg1gnnL1qRaiOQCz58nWewDCXkHzYQNyJopyytnZoaHtTbgSqJE9SgoGt
         KhIL3iu+Q55prrKqwuV5R+BUUgLCt0PD3s1vxmkyb/Xp05NT18uTL95hbmc/C0U8jDih
         lONsI78s/AhNPirbA4HOLAHrQ6+VCci1iH/BZnQdIgfiYh9e3ir4/1M81M9BB+QKabD4
         ozG+62rg26lI1ISjwaMcs2LxQ1tpML/dhk8B3Jk1CWUB7uqDUA8mRVM+E+eq48XGojvt
         MgHaxChK8uUT4lMFc7qV2/TdFqWoJmLQnCp7d6+2ndBh0pougKCL7DKC6RmX1kiXxyFg
         ADdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780598942; x=1781203742;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bSOB8kwgdkJuUcuvvGWTTy+0BwGIhrEyhn+sNY27Rlk=;
        b=cWsLU8LheivyiEl0qg/8w1vl5jtyOvG+GQuYq+oEzITLRubF0mqnNoJ0lZ9QRMdbNW
         RyOqAUg7co3/Np59ggdPUDYJyGEWIzlvol2dKgNhoiYgGaykGBXcQ+HdCFVLvFnF5e/N
         lZb7mldDVquhSia+Zo5Gv3JRGpF6lyzqxk+swI3oD8R3+7+SXPoJ3UhQuq2kDzcyzYIm
         i/84zb+E6C34JrBkoXhSUs0cOIbw3+MRZzVMxk9/6qCRgtjk6EuehdfLsJPmUP0zXq7c
         5RZce8MZKYFlK7kXM1C7D/Q8wzVdsP+zs2mscvZhlnY4g/FJx38Uk2AbUr+04cP+UJzd
         Q/0w==
X-Forwarded-Encrypted: i=1; AFNElJ/MKZPj+wtX3u53SdgnzmOp0QBnIe1hp2BkAEP9K2jbWRrUglbD/ZQqO9aAuVsj5/0XmIcNQc/MqkT0Wg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7jBMu7GJV8rMULGuWOq8oTMXWqT2goq24SssKxXA6Zi19Fkci
	fLO/dilzkj2rKud+jD8QrCXa1P0vLpvqRrAromA/0k87yFc/tYrNyOSYCQhFEFzFzOkzKPZ5/Vv
	8B3d9e7SrdQEizZbpUeydjk9Il4jatJJELzeKdSdhgmHa65+j1L/BrvOKAJvBmRR9
X-Gm-Gg: Acq92OFuROEgKs+Dx3h9UjNQ2RhNatZkASVXh5WhvhFsT9CVF8v97E6FGC9I2pzzf6j
	fhV1cB91EAP1FDo2DVqZE7Cny8akw2tL2ubMPE+Z4lHqTAz0fKgqGUiIekODMJVFVu9/fJz/SS1
	kXly/uq5nIpZwjgnXqfDe6nQu5XDi5UOcEHBpfgFJDl5baqjObCE3+Bz9/9fiBhHGNp//KdpRyt
	dUz669SaDpruGg+0kfu89+hnpJd6FQ+QofT4+hFgqbgBtLlh4SxQ+0zFVwprR01IHFOOp9PUcaI
	dCICR/AX+YDD7tK2TniAneTuyefwsXbQGa0lP889NID9EQ99AFaz/BbCHdtoXPIYR+i3jpPeoQL
	Vq/1zkqwR39BT/0Dn1C5MOctjJbLp
X-Received: by 2002:ad4:4e09:0:b0:8cc:dd12:a545 with SMTP id 6a1803df08f44-8cee5f9e8c3mr5118226d6.8.1780598942335;
        Thu, 04 Jun 2026 11:49:02 -0700 (PDT)
X-Received: by 2002:ad4:4e09:0:b0:8cc:dd12:a545 with SMTP id 6a1803df08f44-8cee5f9e8c3mr5117046d6.8.1780598941090;
        Thu, 04 Jun 2026 11:49:01 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccd9fda2sm60367866d6.2.2026.06.04.11.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 11:49:00 -0700 (PDT)
Message-ID: <f8a49ca906428f6190f5df2ae93a7966b7734199.camel@redhat.com>
Subject: Re: [PATCH v17 4/6] rust: faux: Allow retrieving a bound Device
From: lyude@redhat.com
To: Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>,
 Gary Guo	 <gary@garyguo.net>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, driver-core@lists.linux.dev, Miguel Ojeda	
 <ojeda@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org,  Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Benno Lossin
 <lossin@kernel.org>, linaro-mm-sig@lists.linaro.org, Mukesh Kumar
 Chaurasiya	 <mkchauras@gmail.com>, Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida	 <daniel.almeida@collabora.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Date: Thu, 04 Jun 2026 14:48:59 -0400
In-Reply-To: <DJ0AREWNNJPT.9XEZC98B76II@kernel.org>
References: <20260603195210.693856-1-lyude@redhat.com>
	 <20260603195210.693856-5-lyude@redhat.com>
	 <DJ0AREWNNJPT.9XEZC98B76II@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

I mentioned this already to Danilo via alternate channels, but to
clarify - this patch -is- actually needed, as we make use of
`AsRef<Device<Bound>>` in the kunit test for SGTable

On Thu, 2026-06-04 at 15:25 +0200, Danilo Krummrich wrote:
> On Wed Jun 3, 2026 at 9:42 PM CEST, Lyude Paul wrote:
> > When writing up some rust code that used faux devices for unit
> > testing, I
> > noticed that we never actually added the Bound device context to
> > faux::Registration's AsRef<device::Device> implementation. This
> > being said:
> > the Registration object itself is proof that a driver is bound to
> > the
> > device - so this should be safe.
>=20
> Yes, it should be, but the reasons are non-trivial and should be part
> of the
> safety comment below.
>=20
> =C2=A0 - faux_match() always returns 1, and probe runs synchronously
> =C2=A0=C2=A0=C2=A0 (PROBE_FORCE_SYNCHRONOUS)
>=20
> =C2=A0 - suppress_bind_attrs =3D true on faux_driver prevents userspace-
> triggered
> =C2=A0=C2=A0=C2=A0 unbind via sysfs
>=20
> =C2=A0 - mem::forget(Registration) is not a problem; if the Registration
> is leaked,
> =C2=A0=C2=A0=C2=A0 the faux device stays bound forever
>=20
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> I can pick this through the driver-core tree already, as it seems
> this it not
> needed by this series. Feel free to resend as individual patch for
> thus purpose.
>=20
> > ---
> > =C2=A0rust/kernel/faux.rs | 7 ++++---
> > =C2=A01 file changed, 4 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
> > index 43b4974f48cd2..e0856b2964a2c 100644
> > --- a/rust/kernel/faux.rs
> > +++ b/rust/kernel/faux.rs
> > @@ -25,7 +25,8 @@
> > =C2=A0///
> > =C2=A0/// # Invariants
> > =C2=A0///
> > -/// `self.0` always holds a valid pointer to an initialized and
> > registered [`struct faux_device`].
> > +/// - `self.0` always holds a valid pointer to an initialized and
> > registered [`struct faux_device`].
> > +/// - This object is proof that the object described by this
> > `Registration` is bound to a device.
> > =C2=A0///
> > =C2=A0/// [`struct faux_device`]: srctree/include/linux/device/faux.h
> > =C2=A0pub struct Registration(NonNull<bindings::faux_device>);
> > @@ -59,8 +60,8 @@ fn as_raw(&self) -> *mut bindings::faux_device {
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0}
> > =C2=A0
> > -impl AsRef<device::Device> for Registration {
> > -=C2=A0=C2=A0=C2=A0 fn as_ref(&self) -> &device::Device {
> > +impl AsRef<device::Device<device::Bound>> for Registration {
> > +=C2=A0=C2=A0=C2=A0 fn as_ref(&self) -> &device::Device<device::Bound> =
{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: The underly=
ing `device` in `faux_device` is
> > guaranteed by the C API to be
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // a valid initialized=
 `device`.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe {
> > device::Device::from_raw(addr_of_mut!((*self.as_raw()).dev)) }
> > --=20
> > 2.54.0

