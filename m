Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070BF3E3C5A
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 07:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785914075; cv=pass; b=MAVv48iz2vWq2AqgKQosEzIA9+8nIc4BQHJchWcfEQ15efn3h7E3fCZ3MLdcd4KsUX+p3yYYu+T/U8B4K1E3aP07pAnemAXVy4scAVkhlH0b4bT9m+er/c9HkZfofe3CfRr5LVqLOk9lsjNtmiS2E4TkKzr6PR0RXHS3aiy+N/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785914075; c=relaxed/simple;
	bh=C9YmLVwqrtGAztR+ijFD+tcUtJeP+XENEhmMcOemdR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uKXPyZC3uHdCml7m2tKEfsfyYfM2w6pEOLX3pO/mUc9j4Di89ADudBF1EGU6MqDipcYzr4DbRir3yv4+G6Xeq4cltvhtbnqMzXD0Jf1OAXWmYkORqtp3VAQ6SZ/r10Q15BRCR2GRYGWSX6sMvMv/NleD47gDivrv4IHSdu4Vd90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bDUeckHX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=A6scVRQd; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bDUeckHX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="A6scVRQd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785914069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vsKsLm26hnfYQ+4PbqeoTtWM17IaeJCQLldfhZXUNws=;
	b=bDUeckHXEYncQ8fqohnfppvr4ztDcjkHTvE1mPlsH6D3O/dM/CqT49mgWFGcM2HD1/Gnvh
	+Jd7EaHuxwGT9114CyVfPHN7SFwxMgE+R8ijjOeA2aGd0PwQ7vCZe/+bwqqXQ5GE1eRVA8
	nmds6wafuz4fxOi/uOCGE6Z97B8/Erk=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-MXr-BYZcMX-hNF-L5Izu4Q-1; Wed, 05 Aug 2026 03:14:27 -0400
X-MC-Unique: MXr-BYZcMX-hNF-L5Izu4Q-1
X-Mimecast-MFC-AGG-ID: MXr-BYZcMX-hNF-L5Izu4Q_1785914067
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81e6abfca68so14231577b3.1
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 00:14:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785914067; cv=none;
        d=google.com; s=arc-20260327;
        b=FS3PciIQYVL7r98lRN9TzqRrKRnoOn1VWtg409Bi0KIFQPatv4RI35YE4tv/ZHv/RT
         xiVkx0La+6O1XO9TkCHKktDJDalBXo3N+GlpErIWWRvNMSwj51UC0dd9v67IQn9gP8u4
         fWCwKvoEgUNNvb/wYQ0AYhGKUa3uKRZ+lnNHJo6oHzHRG7BmgnLFPoePtPZ+7L1qzSeP
         YGd5gUVIP20OIZYUYVmkVXMy1MnYA7P4zyXQ2LLebwp8pOy3gvgmEvCXIIkfKvpeSmMW
         gteTDsxwFhUGFOxTaFoXrJ2Y5FkCsyP/P2TO3+SOS759+v3jwhGY6u26XquKgu2VORSi
         H3gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vsKsLm26hnfYQ+4PbqeoTtWM17IaeJCQLldfhZXUNws=;
        fh=zTNce81h02AzkWH1OnbiLJ+sn2McE7cFKQjX6bJN1n0=;
        b=fTxbPe8hJWJh/QYxLgBQsU5SKTn5kemaAzJoPVy571UQX0BSy0eVuz+mGXwmnWHLM5
         k72C+LZmKXAHb+80XI6TuJg+UaI8HPXiojGBssB2DuE9ixFN7LicYcRklWkKQTcm9Nlp
         n4esisCYJ/d7PUT9TU4Ju6zHJVeZ++RuCeuaQtSlkbo2pCyTFnU5BJwEqTOpDHTcKxzH
         0nvT0mYahw39dI138lGJKFzthaSxM9hZfZVAi7UC7YKZrqdmWHAuBF57xE0L2Tp2Xohg
         yqRlunGhX9FG6WdSxpItJa2vBxxT/zjSYqLORji5jBAx2rhXYw5YvF8UilxJhJB24J3a
         tTSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785914067; x=1786518867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vsKsLm26hnfYQ+4PbqeoTtWM17IaeJCQLldfhZXUNws=;
        b=A6scVRQdz1a9cfu2UQ9qXbPCEDpyxRxktHiv5WLheeRpL6rhuXoDoMhy2Wjc+422YS
         n7h5XYnk5y1BPdOGZn/UFtNbu7iWPz82gHwcNSO+FzwH9n2WrtouHRIaj0uOd9EJS+kM
         wte37C8CnYZmoRu5jgg1XXJmY6jNfV1B3aI2qhBffHGGODhnU4JGqz2uUEI4P+OhoK7O
         SE6J6a0tAxhKyqV9CgBXCxs+3rqUREQwsAHviidq/ZBM+xMJjnM0z/ZyE3h3IQM4NSgK
         tlMWN2lsh8sa+ZZdpa7sILWj6MXbuEq3angLt7bNPGj+XBMSROhY1mtGQzh1Zu2iSqwH
         QBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785914067; x=1786518867;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vsKsLm26hnfYQ+4PbqeoTtWM17IaeJCQLldfhZXUNws=;
        b=Se1eN1vZpWjVBG6pyh+Bevo+tUSlBETnOG6r12ffFppuw99Jj+q3dUGAKGKRsepqdP
         FimnP736rXcB7BQ6PCbhMmHDAkPCHFBo9Vw/Gz/ys9dqAgknPYCgjnH/UYhERAVA6Yxz
         wpoQn4a47S8TPvEG7i5uY9AhoEw7K+X4VTuQqlSkHK0h9GPxiz99/rluBhUohUpBmtvR
         6It6heNOmu3fMeoo4CfePPIqbQPs9DqFhdRPj0vCp6cdQxHfW+Fwf1Xp4eCuG2IgknMV
         sBb48seYELsmerWfd3PZs3CprBUrUd0IlZspJLgIadOKg/s+CrtalS85zTx2CY/m9TEV
         JO7A==
X-Forwarded-Encrypted: i=1; AHgh+RqWvD5ca+A+6RLKR6KtgF9w85bSVkuo1tF/Ibb8oRWqvPQuI2aVJUIXbVmEC91pLoLtBcm6eoHDLKP00A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbI3zJPPhUg7qJXdtLvasNcu2k1oh7UtwvLzlczbichdzXB8Cz
	sHxVQesJm300gLp/oZPMEyZ5KBxpzmiCszXYKjkiqXmSBT+O5HTc5O/NycJCcEs2BiQTyLCNRl5
	8iwZIigHAV3oCQCpygQ9szDVIXoVWLcfxDjnWXWSqWcoo5pfC/gdTd08dzpOtduzTqFLYfy3THn
	39bZ8UYpK0rFVAhULXu0VONJyipfsMwX6zA1aDxYg=
X-Gm-Gg: AR+sD13Djp1q8p/KnWz0aKt3MMatP2DSAuNhOdzwZxpzTS/lVfNK0DgLhydGf2oydIU
	EXkOXcVEtj+ZCkbeIr19Hk+OWDGNLCxbZ6G2lAr8+eYYnm2ntYzsd8FPsLE7mxL9WRBxX70ZxcF
	shaNREvV/MqG8w2XLxeKrdp+HOfDmlUyInuH6nfquBzM/f9cW8tamBSZA=
X-Received: by 2002:a05:690c:f14:b0:81f:3969:4abb with SMTP id 00721157ae682-820229a9594mr23532287b3.29.1785914066150;
        Wed, 05 Aug 2026 00:14:26 -0700 (PDT)
X-Received: by 2002:a05:690c:f14:b0:81f:3969:4abb with SMTP id
 00721157ae682-820229a9594mr23531967b3.29.1785914065493; Wed, 05 Aug 2026
 00:14:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723183219.737296-1-briandaniels@google.com>
 <CADSE00L5O+Pc5SXy_Wb6i3xBUu1z+BiDnu4os3tvpYmxd5j-7g@mail.gmail.com> <CAD4i_GR0Njq9T38VKJ1c39GW5=sFVvMCv=kSEjFpZ+XhWnqUZA@mail.gmail.com>
In-Reply-To: <CAD4i_GR0Njq9T38VKJ1c39GW5=sFVvMCv=kSEjFpZ+XhWnqUZA@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 5 Aug 2026 09:14:14 +0200
X-Gm-Features: AUfX_mzLUVRHRj8fDbM50WkB3tVR8SDzl9MJ5fzKpq6d2Ft6cZOvc83w9OTgH90
Message-ID: <CADSE00LDP3z+ftfr67q60sypPBm5VdiE+QLYiK_PJS4D6vFFZQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] media: add virtio-media driver
To: Brian Daniels <briandaniels@google.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, adelva@google.com, changyeon@google.com, 
	daniel.almeida@collabora.com, eperezma@redhat.com, gnurou@gmail.com, 
	gurchetansingh@google.com, hverkuil@xs4all.nl, jasowang@redhat.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, mst@redhat.com, 
	nicolas.dufresne@collabora.com, virtualization@lists.linux.dev, 
	xuanzhuo@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 5:31=E2=80=AFPM Brian Daniels <briandaniels@google.c=
om> wrote:
>
> Hi Albert,
>
> Thanks so much for testing and sharing your results, glad to hear everyth=
ing is working.
>
> Regarding the `VIDIOC_G/S/TRY_EXT_CTRLS` failures, if you were testing wi=
th a passed-through USB camera, I saw the same failures as well. This behav=
ior depends on how v4l2-compliance changes its logic based on the device's =
driver name. I expect this test will pass on the host, and that's because v=
4l2-compliance reads the device's driver name as `uvcvideo`. In the guest, =
since it's beeing passed-through by virtio-media, the driver name is `virti=
o-media`, and thus v4l2-compliance doesn't change its logic, causing the fa=
ilure.

Hi Brian,

Glad to hear that you had it on your radar and already figured it out.

>
> I worked around this by patching v4l2-compliance to allow overriding the =
device's driver name: https://lore.kernel.org/all/20260528163448.4031965-1-=
briandaniels@google.com/. There are more details in [PATCH v5 0/5] of this =
series if you're curious: https://lore.kernel.org/all/20260723183219.737296=
-1-briandaniels@google.com/

Ah true, my bad! I skipped the note when checking your results. I
won't work around it myself, given that all the other results match.

>
> Thanks again,
> Brian
>
> On Tue, Aug 4, 2026 at 8:29=E2=80=AFAM Albert Esteve <aesteve@redhat.com>=
 wrote:
>>
>> Hi Brian,
>>
>> On Thu, Jul 23, 2026 at 8:32=E2=80=AFPM Brian Daniels <briandaniels@goog=
le.com> wrote:
>> >
>> > From: Alexandre Courbot <gnurou@gmail.com>
>> >
>> > Add the first version of the virtio-media driver.
>> >
>> > This driver acts roughly as a V4L2 relay between user-space and the
>> > virtio virtual device on the host, so it is relatively simple, yet
>> > unconventional. It doesn't use VB2 or other frameworks typically used =
in
>> > a V4L2 driver, and most of its complexity resides in correctly and
>> > efficiently building the virtio descriptor chain to pass to the host,
>> > avoiding copies whenever possible. This is done by
>> > scatterlist_builder.[ch].
>> >
>> > This version supports MMAP buffers, while USERPTR buffers can also be
>> > enabled through a driver option. DMABUF support is still pending.
>> >
>> > NOTE: This depends on the VIRTIO ID being added in this patch:
>> > https://lore.kernel.org/all/20260310-virtio-media-id-v1-1-be211bcf682b=
@redhat.com
>>
>> Tested on top of [1], with the rust-vmm backend [2], and QEMU patch
>> adding the pci device [3].
>>
>> In the guest I have enabled allow_userptr parameter and tested video
>> capture both with mmap and userptr memory types. Both worked perfectly
>> fine.
>>
>> I also tested v4l2-compliance, with results similar to those pasted
>> below. The summary shows:
>>
>>     Total for virtio-media device /dev/video0: 56, Succeeded: 54,
>> Failed: 2, Warnings: 0
>>
>> The additional failed test with respect to the results shown in the
>> cover seems to be `VIDIOC_G/S/TRY_EXT_CTRLS`, where s_ctrl returned
>> error 13. Nevertheless, the results are in line with my expectations,
>> specially with the camera capture tests, so:
>>
>> Tested-by: Albert Esteve <aesteve@redhat.com>
>>
>> [1] https://lore.kernel.org/all/20260310-virtio-media-id-v1-1-be211bcf68=
2b@redhat.com
>> [2] https://github.com/rust-vmm/vhost-device/tree/main/vhost-device-medi=
a
>> [3] https://lore.kernel.org/all/20260630112310.552606-1-aesteve@redhat.c=
om/
>>
>> BR,
>> Albert.
>>
>>
>> >
>> > Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
>> > Co-developed-by: Brian Daniels <briandaniels@google.com>
>> > Signed-off-by: Brian Daniels <briandaniels@google.com>
>> > ---
>> > Guest Setup
>> >
>> > Tests were ran on a Debian 12 guest running with crosvm. The guest ima=
ge
>> > was created with:
>> >
>> > $ virt-builder debian-12 --root-password password:""
>> >
>> > Build crosvm and launch the guest starting at the "Crosvm" section on
>> > this page: https://github.com/chromeos/virtio-media/blob/main/TRY_IT_O=
UT.md#crosvm
>> >
>> > NOTE: Before running v4l2-compliance in the guest, you need to install
>> > v4l-utils and ffmpeg:
>> >
>> > $ apt update && apt install v4l-utils ffmpeg
>> >
>> > ---
>> > Compliance Testing
>> >
>> > This was tested using v4l2-compliance. Since virtio-media serves as
>> > a proxy to host devices for the guest VMs, we expect the guest
>> > compliance test to essentially match the host compliance test for the
>> > same device.
>> >
>> > NOTE: v4l2-compliance changes its test behavior depending on the drive=
r
>> > name. In the guest, the driver name for virtio-media proxied-devices i=
s
>> > always "virtio-media", even if the actual host device has a driver nam=
e
>> > of e.g. "uvcvideo". To ensure the test is consistent between the host
>> > and the guest, I created a patch for the v4l2-compliance tool that
>> > allows you to override the driver name. All test results that follow u=
se
>> > this patch:
>> > https://lore.kernel.org/r/20260528163448.4031965-1-briandaniels@google=
.com/
>> >
>> > All tests used a Logitech USB Webcam C925e.
>> >
>> > As tested on the host:
>> >
>> > $ v4l2-compliance -d1 -s
>> >
>> > v4l2-compliance 1.33.0-5471, 64 bits, 64-bit time_t
>> > v4l2-compliance SHA: 9f2d3ea879ff 2026-05-28 14:45:11
>> >
>> > Compliance test for uvcvideo device /dev/video1:
>> >
>> > Driver Info:
>> >         Driver name      : uvcvideo
>> >         Card type        : Logitech Webcam C925e
>> >         Bus info         : usb-0000:04:00.1-3
>> >         Driver version   : 6.18.14
>> >         Capabilities     : 0x84a00001
>> >                 Video Capture
>> >                 Metadata Capture
>> >                 Streaming
>> >                 Extended Pix Format
>> >                 Device Capabilities
>> >         Device Caps      : 0x04200001
>> >                 Video Capture
>> >                 Streaming
>> >                 Extended Pix Format
>> > Media Driver Info:
>> >         Driver name      : uvcvideo
>> >         Model            : Logitech Webcam C925e
>> >         Serial           : 686F371F
>> >         Bus info         : usb-0000:04:00.1-3
>> >         Media version    : 6.18.14
>> >         Hardware revision: 0x00000016 (22)
>> >         Driver version   : 6.18.14
>> > Interface Info:
>> >         ID               : 0x03000002
>> >         Type             : V4L Video
>> > Entity Info:
>> >         ID               : 0x00000001 (1)
>> >         Name             : Logitech Webcam C925e
>> >         Function         : V4L2 I/O
>> >         Flags            : default
>> >         Pad 0x01000007   : 0: Sink
>> >           Link 0x0200001f: from remote pad 0x100000a of entity 'Proces=
sing 3' (Video Pixel Formatter): Data, Enabled, Immutable
>> >
>> > Required ioctls:
>> >         test MC information (see 'Media Driver Info' above): OK
>> >         test VIDIOC_QUERYCAP: OK
>> >         test invalid ioctls: OK
>> >
>> > Allow for multiple opens:
>> >         test second /dev/video1 open: OK
>> >         test VIDIOC_QUERYCAP: OK
>> >         test VIDIOC_G/S_PRIORITY: OK
>> >         test for unlimited opens: OK
>> >
>> > Debug ioctls:
>> >         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>> >         test VIDIOC_LOG_STATUS: OK (Not Supported)
>> >
>> > Input ioctls:
>> >         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>> >         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>> >         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>> >         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>> >         test VIDIOC_G/S/ENUMINPUT: OK
>> >         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>> >         Inputs: 1 Audio Inputs: 0 Tuners: 0
>> >
>> > Output ioctls:
>> >         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>> >         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>> >         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>> >         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>> >         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>> >         Outputs: 0 Audio Outputs: 0 Modulators: 0
>> >
>> > Input/Output configuration ioctls:
>> >         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>> >         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>> >         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>> >         test VIDIOC_G/S_EDID: OK (Not Supported)
>> >
>> > Control ioctls (Input 0):
>> >         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>> >         test VIDIOC_QUERYCTRL: OK
>> >         test VIDIOC_G/S_CTRL: OK
>> >                 fail: v4l2-test-controls.cpp(983): ret !=3D EINVAL (go=
t 13)
>> >         test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
>> >         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>> >         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>> >         Standard Controls: 19 Private Controls: 0
>> >
>> > Format ioctls (Input 0):
>> >         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>> >         test VIDIOC_G/S_PARM: OK
>> >         test VIDIOC_G_FBUF: OK (Not Supported)
>> >         test VIDIOC_G_FMT: OK
>> >         test VIDIOC_TRY_FMT: OK
>> >         test VIDIOC_S_FMT: OK
>> >         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>> >         test Cropping: OK (Not Supported)
>> >         test Composing: OK (Not Supported)
>> >         test Scaling: OK (Not Supported)
>> >
>> > Codec ioctls (Input 0):
>> >         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>> >         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>> >         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>> >
>> > Buffer ioctls (Input 0):
>> >         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>> >         test CREATE_BUFS maximum buffers: OK
>> >         test VIDIOC_REMOVE_BUFS: OK
>> >         test VIDIOC_EXPBUF: OK
>> >         test Requests: OK (Not Supported)
>> >         test blocking wait: OK
>> >
>> > Test input 0:
>> >
>> > Streaming ioctls:
>> >         test read/write: OK (Not Supported)
>> >
>> >         Video Capture: Frame #000
>> >         Video Capture: Frame #001
>> >         Video Capture: Frame #002
>> >         Video Capture: Frame #003
>> >         Video Capture: Frame #004
>> >         Video Capture: Frame #005
>> >         Video Capture: Frame #006
>> >         Video Capture: Frame #007
>> >         Video Capture: Frame #008
>> >         Video Capture: Frame #009
>> >         Video Capture: Frame #010
>> >         Video Capture: Frame #011
>> >         Video Capture: Frame #012
>> >         Video Capture: Frame #013
>> >         Video Capture: Frame #014
>> >         Video Capture: Frame #015
>> >         Video Capture: Frame #016
>> >         Video Capture: Frame #017
>> >         Video Capture: Frame #018
>> >         Video Capture: Frame #019
>> >         Video Capture: Frame #020
>> >         Video Capture: Frame #021
>> >         Video Capture: Frame #022
>> >         Video Capture: Frame #023
>> >         Video Capture: Frame #024
>> >         Video Capture: Frame #025
>> >         Video Capture: Frame #026
>> >         Video Capture: Frame #027
>> >         Video Capture: Frame #028
>> >         Video Capture: Frame #029
>> >         Video Capture: Frame #030
>> >         Video Capture: Frame #031
>> >         Video Capture: Frame #032
>> >         Video Capture: Frame #033
>> >         Video Capture: Frame #034
>> >         Video Capture: Frame #035
>> >         Video Capture: Frame #036
>> >         Video Capture: Frame #037
>> >         Video Capture: Frame #038
>> >         Video Capture: Frame #039
>> >         Video Capture: Frame #040
>> >         Video Capture: Frame #041
>> >         Video Capture: Frame #042
>> >         Video Capture: Frame #043
>> >         Video Capture: Frame #044
>> >         Video Capture: Frame #045
>> >         Video Capture: Frame #046
>> >         Video Capture: Frame #047
>> >         Video Capture: Frame #048
>> >         Video Capture: Frame #049
>> >         Video Capture: Frame #050
>> >         Video Capture: Frame #051
>> >         Video Capture: Frame #052
>> >         Video Capture: Frame #053
>> >         Video Capture: Frame #054
>> >         Video Capture: Frame #055
>> >         Video Capture: Frame #056
>> >         Video Capture: Frame #057
>> >         Video Capture: Frame #058
>> >         Video Capture: Frame #059
>> >
>> >         test MMAP (no poll, REQBUFS): OK
>> >
>> >         Video Capture: Frame #000 (select)
>> >         Video Capture: Frame #001 (select)
>> >         Video Capture: Frame #002 (select)
>> >         Video Capture: Frame #003 (select)
>> >         Video Capture: Frame #004 (select)
>> >         Video Capture: Frame #005 (select)
>> >         Video Capture: Frame #006 (select)
>> >         Video Capture: Frame #007 (select)
>> >         Video Capture: Frame #008 (select)
>> >         Video Capture: Frame #009 (select)
>> >         Video Capture: Frame #010 (select)
>> >         Video Capture: Frame #011 (select)
>> >         Video Capture: Frame #012 (select)
>> >         Video Capture: Frame #013 (select)
>> >         Video Capture: Frame #014 (select)
>> >         Video Capture: Frame #015 (select)
>> >         Video Capture: Frame #016 (select)
>> >         Video Capture: Frame #017 (select)
>> >         Video Capture: Frame #018 (select)
>> >         Video Capture: Frame #019 (select)
>> >         Video Capture: Frame #020 (select)
>> >         Video Capture: Frame #021 (select)
>> >         Video Capture: Frame #022 (select)
>> >         Video Capture: Frame #023 (select)
>> >         Video Capture: Frame #024 (select)
>> >         Video Capture: Frame #025 (select)
>> >         Video Capture: Frame #026 (select)
>> >         Video Capture: Frame #027 (select)
>> >         Video Capture: Frame #028 (select)
>> >         Video Capture: Frame #029 (select)
>> >         Video Capture: Frame #030 (select)
>> >         Video Capture: Frame #031 (select)
>> >         Video Capture: Frame #032 (select)
>> >         Video Capture: Frame #033 (select)
>> >         Video Capture: Frame #034 (select)
>> >         Video Capture: Frame #035 (select)
>> >         Video Capture: Frame #036 (select)
>> >         Video Capture: Frame #037 (select)
>> >         Video Capture: Frame #038 (select)
>> >         Video Capture: Frame #039 (select)
>> >         Video Capture: Frame #040 (select)
>> >         Video Capture: Frame #041 (select)
>> >         Video Capture: Frame #042 (select)
>> >         Video Capture: Frame #043 (select)
>> >         Video Capture: Frame #044 (select)
>> >         Video Capture: Frame #045 (select)
>> >         Video Capture: Frame #046 (select)
>> >         Video Capture: Frame #047 (select)
>> >         Video Capture: Frame #048 (select)
>> >         Video Capture: Frame #049 (select)
>> >         Video Capture: Frame #050 (select)
>> >         Video Capture: Frame #051 (select)
>> >         Video Capture: Frame #052 (select)
>> >         Video Capture: Frame #053 (select)
>> >         Video Capture: Frame #054 (select)
>> >         Video Capture: Frame #055 (select)
>> >         Video Capture: Frame #056 (select)
>> >         Video Capture: Frame #057 (select)
>> >         Video Capture: Frame #058 (select)
>> >         Video Capture: Frame #059 (select)
>> >
>> >         test MMAP (select, REQBUFS): OK
>> >
>> >         Video Capture: Frame #000 (epoll)
>> >         Video Capture: Frame #001 (epoll)
>> >         Video Capture: Frame #002 (epoll)
>> >         Video Capture: Frame #003 (epoll)
>> >         Video Capture: Frame #004 (epoll)
>> >         Video Capture: Frame #005 (epoll)
>> >         Video Capture: Frame #006 (epoll)
>> >         Video Capture: Frame #007 (epoll)
>> >         Video Capture: Frame #008 (epoll)
>> >         Video Capture: Frame #009 (epoll)
>> >         Video Capture: Frame #010 (epoll)
>> >         Video Capture: Frame #011 (epoll)
>> >         Video Capture: Frame #012 (epoll)
>> >         Video Capture: Frame #013 (epoll)
>> >         Video Capture: Frame #014 (epoll)
>> >         Video Capture: Frame #015 (epoll)
>> >         Video Capture: Frame #016 (epoll)
>> >         Video Capture: Frame #017 (epoll)
>> >         Video Capture: Frame #018 (epoll)
>> >         Video Capture: Frame #019 (epoll)
>> >         Video Capture: Frame #020 (epoll)
>> >         Video Capture: Frame #021 (epoll)
>> >         Video Capture: Frame #022 (epoll)
>> >         Video Capture: Frame #023 (epoll)
>> >         Video Capture: Frame #024 (epoll)
>> >         Video Capture: Frame #025 (epoll)
>> >         Video Capture: Frame #026 (epoll)
>> >         Video Capture: Frame #027 (epoll)
>> >         Video Capture: Frame #028 (epoll)
>> >         Video Capture: Frame #029 (epoll)
>> >         Video Capture: Frame #030 (epoll)
>> >         Video Capture: Frame #031 (epoll)
>> >         Video Capture: Frame #032 (epoll)
>> >         Video Capture: Frame #033 (epoll)
>> >         Video Capture: Frame #034 (epoll)
>> >         Video Capture: Frame #035 (epoll)
>> >         Video Capture: Frame #036 (epoll)
>> >         Video Capture: Frame #037 (epoll)
>> >         Video Capture: Frame #038 (epoll)
>> >         Video Capture: Frame #039 (epoll)
>> >         Video Capture: Frame #040 (epoll)
>> >         Video Capture: Frame #041 (epoll)
>> >         Video Capture: Frame #042 (epoll)
>> >         Video Capture: Frame #043 (epoll)
>> >         Video Capture: Frame #044 (epoll)
>> >         Video Capture: Frame #045 (epoll)
>> >         Video Capture: Frame #046 (epoll)
>> >         Video Capture: Frame #047 (epoll)
>> >         Video Capture: Frame #048 (epoll)
>> >         Video Capture: Frame #049 (epoll)
>> >         Video Capture: Frame #050 (epoll)
>> >         Video Capture: Frame #051 (epoll)
>> >         Video Capture: Frame #052 (epoll)
>> >         Video Capture: Frame #053 (epoll)
>> >         Video Capture: Frame #054 (epoll)
>> >         Video Capture: Frame #055 (epoll)
>> >         Video Capture: Frame #056 (epoll)
>> >         Video Capture: Frame #057 (epoll)
>> >         Video Capture: Frame #058 (epoll)
>> >         Video Capture: Frame #059 (epoll)
>> >
>> >         test MMAP (epoll, REQBUFS): OK
>> >
>> >         Video Capture: Frame #000
>> >         Video Capture: Frame #001
>> >         Video Capture: Frame #002
>> >         Video Capture: Frame #003
>> >         Video Capture: Frame #004
>> >         Video Capture: Frame #005
>> >         Video Capture: Frame #006
>> >         Video Capture: Frame #007
>> >         Video Capture: Frame #008
>> >         Video Capture: Frame #009
>> >         Video Capture: Frame #010
>> >         Video Capture: Frame #011
>> >         Video Capture: Frame #012
>> >         Video Capture: Frame #013
>> >         Video Capture: Frame #014
>> >         Video Capture: Frame #015
>> >         Video Capture: Frame #016
>> >         Video Capture: Frame #017
>> >         Video Capture: Frame #018
>> >         Video Capture: Frame #019
>> >         Video Capture: Frame #020
>> >         Video Capture: Frame #021
>> >         Video Capture: Frame #022
>> >         Video Capture: Frame #023
>> >         Video Capture: Frame #024
>> >         Video Capture: Frame #025
>> >         Video Capture: Frame #026
>> >         Video Capture: Frame #027
>> >         Video Capture: Frame #028
>> >         Video Capture: Frame #029
>> >         Video Capture: Frame #030
>> >         Video Capture: Frame #031
>> >         Video Capture: Frame #032
>> >         Video Capture: Frame #033
>> >         Video Capture: Frame #034
>> >         Video Capture: Frame #035
>> >         Video Capture: Frame #036
>> >         Video Capture: Frame #037
>> >         Video Capture: Frame #038
>> >         Video Capture: Frame #039
>> >         Video Capture: Frame #040
>> >         Video Capture: Frame #041
>> >         Video Capture: Frame #042
>> >         Video Capture: Frame #043
>> >         Video Capture: Frame #044
>> >         Video Capture: Frame #045
>> >         Video Capture: Frame #046
>> >         Video Capture: Frame #047
>> >         Video Capture: Frame #048
>> >         Video Capture: Frame #049
>> >         Video Capture: Frame #050
>> >         Video Capture: Frame #051
>> >         Video Capture: Frame #052
>> >         Video Capture: Frame #053
>> >         Video Capture: Frame #054
>> >         Video Capture: Frame #055
>> >         Video Capture: Frame #056
>> >         Video Capture: Frame #057
>> >         Video Capture: Frame #058
>> >         Video Capture: Frame #059
>> >
>> >         test MMAP (no poll, CREATE_BUFS): OK
>> >
>> >         Video Capture: Frame #000 (select)
>> >         Video Capture: Frame #001 (select)
>> >         Video Capture: Frame #002 (select)
>> >         Video Capture: Frame #003 (select)
>> >         Video Capture: Frame #004 (select)
>> >         Video Capture: Frame #005 (select)
>> >         Video Capture: Frame #006 (select)
>> >         Video Capture: Frame #007 (select)
>> >         Video Capture: Frame #008 (select)
>> >         Video Capture: Frame #009 (select)
>> >         Video Capture: Frame #010 (select)
>> >         Video Capture: Frame #011 (select)
>> >         Video Capture: Frame #012 (select)
>> >         Video Capture: Frame #013 (select)
>> >         Video Capture: Frame #014 (select)
>> >         Video Capture: Frame #015 (select)
>> >         Video Capture: Frame #016 (select)
>> >         Video Capture: Frame #017 (select)
>> >         Video Capture: Frame #018 (select)
>> >         Video Capture: Frame #019 (select)
>> >         Video Capture: Frame #020 (select)
>> >         Video Capture: Frame #021 (select)
>> >         Video Capture: Frame #022 (select)
>> >         Video Capture: Frame #023 (select)
>> >         Video Capture: Frame #024 (select)
>> >         Video Capture: Frame #025 (select)
>> >         Video Capture: Frame #026 (select)
>> >         Video Capture: Frame #027 (select)
>> >         Video Capture: Frame #028 (select)
>> >         Video Capture: Frame #029 (select)
>> >         Video Capture: Frame #030 (select)
>> >         Video Capture: Frame #031 (select)
>> >         Video Capture: Frame #032 (select)
>> >         Video Capture: Frame #033 (select)
>> >         Video Capture: Frame #034 (select)
>> >         Video Capture: Frame #035 (select)
>> >         Video Capture: Frame #036 (select)
>> >         Video Capture: Frame #037 (select)
>> >         Video Capture: Frame #038 (select)
>> >         Video Capture: Frame #039 (select)
>> >         Video Capture: Frame #040 (select)
>> >         Video Capture: Frame #041 (select)
>> >         Video Capture: Frame #042 (select)
>> >         Video Capture: Frame #043 (select)
>> >         Video Capture: Frame #044 (select)
>> >         Video Capture: Frame #045 (select)
>> >         Video Capture: Frame #046 (select)
>> >         Video Capture: Frame #047 (select)
>> >         Video Capture: Frame #048 (select)
>> >         Video Capture: Frame #049 (select)
>> >         Video Capture: Frame #050 (select)
>> >         Video Capture: Frame #051 (select)
>> >         Video Capture: Frame #052 (select)
>> >         Video Capture: Frame #053 (select)
>> >         Video Capture: Frame #054 (select)
>> >         Video Capture: Frame #055 (select)
>> >         Video Capture: Frame #056 (select)
>> >         Video Capture: Frame #057 (select)
>> >         Video Capture: Frame #058 (select)
>> >         Video Capture: Frame #059 (select)
>> >
>> >         test MMAP (select, CREATE_BUFS): OK
>> >
>> >         Video Capture: Frame #000 (epoll)
>> >         Video Capture: Frame #001 (epoll)
>> >         Video Capture: Frame #002 (epoll)
>> >         Video Capture: Frame #003 (epoll)
>> >         Video Capture: Frame #004 (epoll)
>> >         Video Capture: Frame #005 (epoll)
>> >         Video Capture: Frame #006 (epoll)
>> >         Video Capture: Frame #007 (epoll)
>> >         Video Capture: Frame #008 (epoll)
>> >         Video Capture: Frame #009 (epoll)
>> >         Video Capture: Frame #010 (epoll)
>> >         Video Capture: Frame #011 (epoll)
>> >         Video Capture: Frame #012 (epoll)
>> >         Video Capture: Frame #013 (epoll)
>> >         Video Capture: Frame #014 (epoll)
>> >         Video Capture: Frame #015 (epoll)
>> >         Video Capture: Frame #016 (epoll)
>> >         Video Capture: Frame #017 (epoll)
>> >         Video Capture: Frame #018 (epoll)
>> >         Video Capture: Frame #019 (epoll)
>> >         Video Capture: Frame #020 (epoll)
>> >         Video Capture: Frame #021 (epoll)
>> >         Video Capture: Frame #022 (epoll)
>> >         Video Capture: Frame #023 (epoll)
>> >         Video Capture: Frame #024 (epoll)
>> >         Video Capture: Frame #025 (epoll)
>> >         Video Capture: Frame #026 (epoll)
>> >         Video Capture: Frame #027 (epoll)
>> >         Video Capture: Frame #028 (epoll)
>> >         Video Capture: Frame #029 (epoll)
>> >         Video Capture: Frame #030 (epoll)
>> >         Video Capture: Frame #031 (epoll)
>> >         Video Capture: Frame #032 (epoll)
>> >         Video Capture: Frame #033 (epoll)
>> >         Video Capture: Frame #034 (epoll)
>> >         Video Capture: Frame #035 (epoll)
>> >         Video Capture: Frame #036 (epoll)
>> >         Video Capture: Frame #037 (epoll)
>> >         Video Capture: Frame #038 (epoll)
>> >         Video Capture: Frame #039 (epoll)
>> >         Video Capture: Frame #040 (epoll)
>> >         Video Capture: Frame #041 (epoll)
>> >         Video Capture: Frame #042 (epoll)
>> >         Video Capture: Frame #043 (epoll)
>> >         Video Capture: Frame #044 (epoll)
>> >         Video Capture: Frame #045 (epoll)
>> >         Video Capture: Frame #046 (epoll)
>> >         Video Capture: Frame #047 (epoll)
>> >         Video Capture: Frame #048 (epoll)
>> >         Video Capture: Frame #049 (epoll)
>> >         Video Capture: Frame #050 (epoll)
>> >         Video Capture: Frame #051 (epoll)
>> >         Video Capture: Frame #052 (epoll)
>> >         Video Capture: Frame #053 (epoll)
>> >         Video Capture: Frame #054 (epoll)
>> >         Video Capture: Frame #055 (epoll)
>> >         Video Capture: Frame #056 (epoll)
>> >         Video Capture: Frame #057 (epoll)
>> >         Video Capture: Frame #058 (epoll)
>> >         Video Capture: Frame #059 (epoll)
>> >
>> >         test MMAP (epoll, CREATE_BUFS): OK
>> >
>> >         Video Capture: Frame #000
>> >         Video Capture: Frame #001
>> >         Video Capture: Frame #002
>> >         Video Capture: Frame #003
>> >         Video Capture: Frame #004
>> >         Video Capture: Frame #005
>> >         Video Capture: Frame #006
>> >         Video Capture: Frame #007
>> >         Video Capture: Frame #008
>> >         Video Capture: Frame #009
>> >         Video Capture: Frame #010
>> >         Video Capture: Frame #011
>> >         Video Capture: Frame #012
>> >         Video Capture: Frame #013
>> >         Video Capture: Frame #014
>> >         Video Capture: Frame #015
>> >         Video Capture: Frame #016
>> >         Video Capture: Frame #017
>> >         Video Capture: Frame #018
>> >         Video Capture: Frame #019
>> >         Video Capture: Frame #020
>> >         Video Capture: Frame #021
>> >         Video Capture: Frame #022
>> >         Video Capture: Frame #023
>> >         Video Capture: Frame #024
>> >         Video Capture: Frame #025
>> >         Video Capture: Frame #026
>> >         Video Capture: Frame #027
>> >         Video Capture: Frame #028
>> >         Video Capture: Frame #029
>> >         Video Capture: Frame #030
>> >         Video Capture: Frame #031
>> >         Video Capture: Frame #032
>> >         Video Capture: Frame #033
>> >         Video Capture: Frame #034
>> >         Video Capture: Frame #035
>> >         Video Capture: Frame #036
>> >         Video Capture: Frame #037
>> >         Video Capture: Frame #038
>> >         Video Capture: Frame #039
>> >         Video Capture: Frame #040
>> >         Video Capture: Frame #041
>> >         Video Capture: Frame #042
>> >         Video Capture: Frame #043
>> >         Video Capture: Frame #044
>> >         Video Capture: Frame #045
>> >         Video Capture: Frame #046
>> >         Video Capture: Frame #047
>> >         Video Capture: Frame #048
>> >         Video Capture: Frame #049
>> >         Video Capture: Frame #050
>> >         Video Capture: Frame #051
>> >         Video Capture: Frame #052
>> >         Video Capture: Frame #053
>> >         Video Capture: Frame #054
>> >         Video Capture: Frame #055
>> >         Video Capture: Frame #056
>> >         Video Capture: Frame #057
>> >         Video Capture: Frame #058
>> >         Video Capture: Frame #059
>> >
>> >         test USERPTR (no poll): OK
>> >
>> >         Video Capture: Frame #000 (select)
>> >         Video Capture: Frame #001 (select)
>> >         Video Capture: Frame #002 (select)
>> >         Video Capture: Frame #003 (select)
>> >         Video Capture: Frame #004 (select)
>> >         Video Capture: Frame #005 (select)
>> >         Video Capture: Frame #006 (select)
>> >         Video Capture: Frame #007 (select)
>> >         Video Capture: Frame #008 (select)
>> >         Video Capture: Frame #009 (select)
>> >         Video Capture: Frame #010 (select)
>> >         Video Capture: Frame #011 (select)
>> >         Video Capture: Frame #012 (select)
>> >         Video Capture: Frame #013 (select)
>> >         Video Capture: Frame #014 (select)
>> >         Video Capture: Frame #015 (select)
>> >         Video Capture: Frame #016 (select)
>> >         Video Capture: Frame #017 (select)
>> >         Video Capture: Frame #018 (select)
>> >         Video Capture: Frame #019 (select)
>> >         Video Capture: Frame #020 (select)
>> >         Video Capture: Frame #021 (select)
>> >         Video Capture: Frame #022 (select)
>> >         Video Capture: Frame #023 (select)
>> >         Video Capture: Frame #024 (select)
>> >         Video Capture: Frame #025 (select)
>> >         Video Capture: Frame #026 (select)
>> >         Video Capture: Frame #027 (select)
>> >         Video Capture: Frame #028 (select)
>> >         Video Capture: Frame #029 (select)
>> >         Video Capture: Frame #030 (select)
>> >         Video Capture: Frame #031 (select)
>> >         Video Capture: Frame #032 (select)
>> >         Video Capture: Frame #033 (select)
>> >         Video Capture: Frame #034 (select)
>> >         Video Capture: Frame #035 (select)
>> >         Video Capture: Frame #036 (select)
>> >         Video Capture: Frame #037 (select)
>> >         Video Capture: Frame #038 (select)
>> >         Video Capture: Frame #039 (select)
>> >         Video Capture: Frame #040 (select)
>> >         Video Capture: Frame #041 (select)
>> >         Video Capture: Frame #042 (select)
>> >         Video Capture: Frame #043 (select)
>> >         Video Capture: Frame #044 (select)
>> >         Video Capture: Frame #045 (select)
>> >         Video Capture: Frame #046 (select)
>> >         Video Capture: Frame #047 (select)
>> >         Video Capture: Frame #048 (select)
>> >         Video Capture: Frame #049 (select)
>> >         Video Capture: Frame #050 (select)
>> >         Video Capture: Frame #051 (select)
>> >         Video Capture: Frame #052 (select)
>> >         Video Capture: Frame #053 (select)
>> >         Video Capture: Frame #054 (select)
>> >         Video Capture: Frame #055 (select)
>> >         Video Capture: Frame #056 (select)
>> >         Video Capture: Frame #057 (select)
>> >         Video Capture: Frame #058 (select)
>> >         Video Capture: Frame #059 (select)
>> >
>> >         test USERPTR (select): OK
>> >         test DMABUF: Cannot test, specify --expbuf-device
>> >
>> > Total for uvcvideo device /dev/video1: 58, Succeeded: 57, Failed: 1, W=
arnings: 0
>> >
>> > As tested on the guest:
>> >
>> > $ v4l2-compliance -d0 -s --driver-name uvcvideo
>> >
>> > v4l2-compliance 1.33.0-5457, 64 bits, 64-bit time_t
>> > v4l2-compliance SHA: e7e240f546f3 2026-05-28 17:06:12
>> >
>> > Compliance test for uvcvideo device (overridden from virtio-media) /de=
v/video0:
>> >
>> > Driver Info:
>> >         Driver name      : uvcvideo
>> >         Card type        : Logitech Webcam C925e
>> >         Bus info         : platform:virtio-media
>> >         Driver version   : 7.1.0
>> >         Capabilities     : 0x84200001
>> >                 Video Capture
>> >                 Streaming
>> >                 Extended Pix Format
>> >                 Device Capabilities
>> >         Device Caps      : 0x04200001
>> >                 Video Capture
>> >                 Streaming
>> >                 Extended Pix Format
>> >
>> > Required ioctls:
>> >         test VIDIOC_QUERYCAP: OK
>> >         test invalid ioctls: OK
>> >
>> > Allow for multiple opens:
>> >         test second /dev/video0 open: OK
>> >         test VIDIOC_QUERYCAP: OK
>> >         test VIDIOC_G/S_PRIORITY: OK
>> >         test for unlimited opens: OK
>> >
>> > Debug ioctls:
>> >         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>> >         test VIDIOC_LOG_STATUS: OK (Not Supported)
>> >
>> > Input ioctls:
>> >         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>> >         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>> >         test VIDIOC_S_HW_FREQ_SEEK: OK
>> >         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>> >         test VIDIOC_G/S/ENUMINPUT: OK
>> >         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>> >         Inputs: 1 Audio Inputs: 0 Tuners: 0
>> >
>> > Output ioctls:
>> >         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>> >         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>> >         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>> >         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>> >         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>> >         Outputs: 0 Audio Outputs: 0 Modulators: 0
>> >
>> > Input/Output configuration ioctls:
>> >         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>> >         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>> >         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>> >         test VIDIOC_G/S_EDID: OK (Not Supported)
>> >
>> > Control ioctls (Input 0):
>> >         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>> >         test VIDIOC_QUERYCTRL: OK
>> >         test VIDIOC_G/S_CTRL: OK
>> >                 fail: v4l2-test-controls.cpp(981): ret (got 22)
>> >         test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
>> >         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>> >         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>> >         Standard Controls: 19 Private Controls: 0
>> >
>> > Format ioctls (Input 0):
>> >         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>> >         test VIDIOC_G/S_PARM: OK
>> >         test VIDIOC_G_FBUF: OK (Not Supported)
>> >         test VIDIOC_G_FMT: OK
>> >         test VIDIOC_TRY_FMT: OK
>> >         test VIDIOC_S_FMT: OK
>> >         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>> >         test Cropping: OK (Not Supported)
>> >         test Composing: OK (Not Supported)
>> >         test Scaling: OK (Not Supported)
>> >
>> > Codec ioctls (Input 0):
>> >         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>> >         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>> >         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>> >
>> > Buffer ioctls (Input 0):
>> >         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>> >         test CREATE_BUFS maximum buffers: OK
>> >         test VIDIOC_REMOVE_BUFS: OK
>> >         test VIDIOC_EXPBUF: OK (Not Supported)
>> >         test Requests: OK (Not Supported)
>> >         test blocking wait: OK
>> >
>> > Test input 0:
>> >
>> > Streaming ioctls:
>> >         test read/write: OK (Not Supported)
>> >
>> >         Video Capture: Frame #000
>> >         Video Capture: Frame #001
>> >         Video Capture: Frame #002
>> >         Video Capture: Frame #003
>> >         Video Capture: Frame #004
>> >         Video Capture: Frame #005
>> >         Video Capture: Frame #006
>> >         Video Capture: Frame #007
>> >         Video Capture: Frame #008
>> >         Video Capture: Frame #009
>> >         Video Capture: Frame #010
>> >         Video Capture: Frame #011
>> >         Video Capture: Frame #012
>> >         Video Capture: Frame #013
>> >         Video Capture: Frame #014
>> >         Video Capture: Frame #015
>> >         Video Capture: Frame #016
>> >         Video Capture: Frame #017
>> >         Video Capture: Frame #018
>> >         Video Capture: Frame #019
>> >         Video Capture: Frame #020
>> >         Video Capture: Frame #021
>> >         Video Capture: Frame #022
>> >         Video Capture: Frame #023
>> >         Video Capture: Frame #024
>> >         Video Capture: Frame #025
>> >         Video Capture: Frame #026
>> >         Video Capture: Frame #027
>> >         Video Capture: Frame #028
>> >         Video Capture: Frame #029
>> >         Video Capture: Frame #030
>> >         Video Capture: Frame #031
>> >         Video Capture: Frame #032
>> >         Video Capture: Frame #033
>> >         Video Capture: Frame #034
>> >         Video Capture: Frame #035
>> >         Video Capture: Frame #036
>> >         Video Capture: Frame #037
>> >         Video Capture: Frame #038
>> >         Video Capture: Frame #039
>> >         Video Capture: Frame #040
>> >         Video Capture: Frame #041
>> >         Video Capture: Frame #042
>> >         Video Capture: Frame #043
>> >         Video Capture: Frame #044
>> >         Video Capture: Frame #045
>> >         Video Capture: Frame #046
>> >         Video Capture: Frame #047
>> >         Video Capture: Frame #048
>> >         Video Capture: Frame #049
>> >         Video Capture: Frame #050
>> >         Video Capture: Frame #051
>> >         Video Capture: Frame #052
>> >         Video Capture: Frame #053
>> >         Video Capture: Frame #054
>> >         Video Capture: Frame #055
>> >         Video Capture: Frame #056
>> >         Video Capture: Frame #057
>> >         Video Capture: Frame #058
>> >         Video Capture: Frame #059
>> >
>> >         test MMAP (no poll, REQBUFS): OK
>> >
>> >         Video Capture: Frame #000 (select)
>> >         Video Capture: Frame #001 (select)
>> >         Video Capture: Frame #002 (select)
>> >         Video Capture: Frame #003 (select)
>> >         Video Capture: Frame #004 (select)
>> >         Video Capture: Frame #005 (select)
>> >         Video Capture: Frame #006 (select)
>> >         Video Capture: Frame #007 (select)
>> >         Video Capture: Frame #008 (select)
>> >         Video Capture: Frame #009 (select)
>> >         Video Capture: Frame #010 (select)
>> >         Video Capture: Frame #011 (select)
>> >         Video Capture: Frame #012 (select)
>> >         Video Capture: Frame #013 (select)
>> >         Video Capture: Frame #014 (select)
>> >         Video Capture: Frame #015 (select)
>> >         Video Capture: Frame #016 (select)
>> >         Video Capture: Frame #017 (select)
>> >         Video Capture: Frame #018 (select)
>> >         Video Capture: Frame #019 (select)
>> >         Video Capture: Frame #020 (select)
>> >         Video Capture: Frame #021 (select)
>> >         Video Capture: Frame #022 (select)
>> >         Video Capture: Frame #023 (select)
>> >         Video Capture: Frame #024 (select)
>> >         Video Capture: Frame #025 (select)
>> >         Video Capture: Frame #026 (select)
>> >         Video Capture: Frame #027 (select)
>> >         Video Capture: Frame #028 (select)
>> >         Video Capture: Frame #029 (select)
>> >         Video Capture: Frame #030 (select)
>> >         Video Capture: Frame #031 (select)
>> >         Video Capture: Frame #032 (select)
>> >         Video Capture: Frame #033 (select)
>> >         Video Capture: Frame #034 (select)
>> >         Video Capture: Frame #035 (select)
>> >         Video Capture: Frame #036 (select)
>> >         Video Capture: Frame #037 (select)
>> >         Video Capture: Frame #038 (select)
>> >         Video Capture: Frame #039 (select)
>> >         Video Capture: Frame #040 (select)
>> >         Video Capture: Frame #041 (select)
>> >         Video Capture: Frame #042 (select)
>> >         Video Capture: Frame #043 (select)
>> >         Video Capture: Frame #044 (select)
>> >         Video Capture: Frame #045 (select)
>> >         Video Capture: Frame #046 (select)
>> >         Video Capture: Frame #047 (select)
>> >         Video Capture: Frame #048 (select)
>> >         Video Capture: Frame #049 (select)
>> >         Video Capture: Frame #050 (select)
>> >         Video Capture: Frame #051 (select)
>> >         Video Capture: Frame #052 (select)
>> >         Video Capture: Frame #053 (select)
>> >         Video Capture: Frame #054 (select)
>> >         Video Capture: Frame #055 (select)
>> >         Video Capture: Frame #056 (select)
>> >         Video Capture: Frame #057 (select)
>> >         Video Capture: Frame #058 (select)
>> >         Video Capture: Frame #059 (select)
>> >
>> >         test MMAP (select, REQBUFS): OK
>> >
>> >         Video Capture: Frame #000 (epoll)
>> >         Video Capture: Frame #001 (epoll)
>> >         Video Capture: Frame #002 (epoll)
>> >         Video Capture: Frame #003 (epoll)
>> >         Video Capture: Frame #004 (epoll)
>> >         Video Capture: Frame #005 (epoll)
>> >         Video Capture: Frame #006 (epoll)
>> >         Video Capture: Frame #007 (epoll)
>> >         Video Capture: Frame #008 (epoll)
>> >         Video Capture: Frame #009 (epoll)
>> >         Video Capture: Frame #010 (epoll)
>> >         Video Capture: Frame #011 (epoll)
>> >         Video Capture: Frame #012 (epoll)
>> >         Video Capture: Frame #013 (epoll)
>> >         Video Capture: Frame #014 (epoll)
>> >         Video Capture: Frame #015 (epoll)
>> >         Video Capture: Frame #016 (epoll)
>> >         Video Capture: Frame #017 (epoll)
>> >         Video Capture: Frame #018 (epoll)
>> >         Video Capture: Frame #019 (epoll)
>> >         Video Capture: Frame #020 (epoll)
>> >         Video Capture: Frame #021 (epoll)
>> >         Video Capture: Frame #022 (epoll)
>> >         Video Capture: Frame #023 (epoll)
>> >         Video Capture: Frame #024 (epoll)
>> >         Video Capture: Frame #025 (epoll)
>> >         Video Capture: Frame #026 (epoll)
>> >         Video Capture: Frame #027 (epoll)
>> >         Video Capture: Frame #028 (epoll)
>> >         Video Capture: Frame #029 (epoll)
>> >         Video Capture: Frame #030 (epoll)
>> >         Video Capture: Frame #031 (epoll)
>> >         Video Capture: Frame #032 (epoll)
>> >         Video Capture: Frame #033 (epoll)
>> >         Video Capture: Frame #034 (epoll)
>> >         Video Capture: Frame #035 (epoll)
>> >         Video Capture: Frame #036 (epoll)
>> >         Video Capture: Frame #037 (epoll)
>> >         Video Capture: Frame #038 (epoll)
>> >         Video Capture: Frame #039 (epoll)
>> >         Video Capture: Frame #040 (epoll)
>> >         Video Capture: Frame #041 (epoll)
>> >         Video Capture: Frame #042 (epoll)
>> >         Video Capture: Frame #043 (epoll)
>> >         Video Capture: Frame #044 (epoll)
>> >         Video Capture: Frame #045 (epoll)
>> >         Video Capture: Frame #046 (epoll)
>> >         Video Capture: Frame #047 (epoll)
>> >         Video Capture: Frame #048 (epoll)
>> >         Video Capture: Frame #049 (epoll)
>> >         Video Capture: Frame #050 (epoll)
>> >         Video Capture: Frame #051 (epoll)
>> >         Video Capture: Frame #052 (epoll)
>> >         Video Capture: Frame #053 (epoll)
>> >         Video Capture: Frame #054 (epoll)
>> >         Video Capture: Frame #055 (epoll)
>> >         Video Capture: Frame #056 (epoll)
>> >         Video Capture: Frame #057 (epoll)
>> >         Video Capture: Frame #058 (epoll)
>> >         Video Capture: Frame #059 (epoll)
>> >
>> >         test MMAP (epoll, REQBUFS): OK
>> >
>> >         Video Capture: Frame #000
>> >         Video Capture: Frame #001
>> >         Video Capture: Frame #002
>> >         Video Capture: Frame #003
>> >         Video Capture: Frame #004
>> >         Video Capture: Frame #005
>> >         Video Capture: Frame #006
>> >         Video Capture: Frame #007
>> >         Video Capture: Frame #008
>> >         Video Capture: Frame #009
>> >         Video Capture: Frame #010
>> >         Video Capture: Frame #011
>> >         Video Capture: Frame #012
>> >         Video Capture: Frame #013
>> >         Video Capture: Frame #014
>> >         Video Capture: Frame #015
>> >         Video Capture: Frame #016
>> >         Video Capture: Frame #017
>> >         Video Capture: Frame #018
>> >         Video Capture: Frame #019
>> >         Video Capture: Frame #020
>> >         Video Capture: Frame #021
>> >         Video Capture: Frame #022
>> >         Video Capture: Frame #023
>> >         Video Capture: Frame #024
>> >         Video Capture: Frame #025
>> >         Video Capture: Frame #026
>> >         Video Capture: Frame #027
>> >         Video Capture: Frame #028
>> >         Video Capture: Frame #029
>> >         Video Capture: Frame #030
>> >         Video Capture: Frame #031
>> >         Video Capture: Frame #032
>> >         Video Capture: Frame #033
>> >         Video Capture: Frame #034
>> >         Video Capture: Frame #035
>> >         Video Capture: Frame #036
>> >         Video Capture: Frame #037
>> >         Video Capture: Frame #038
>> >         Video Capture: Frame #039
>> >         Video Capture: Frame #040
>> >         Video Capture: Frame #041
>> >         Video Capture: Frame #042
>> >         Video Capture: Frame #043
>> >         Video Capture: Frame #044
>> >         Video Capture: Frame #045
>> >         Video Capture: Frame #046
>> >         Video Capture: Frame #047
>> >         Video Capture: Frame #048
>> >         Video Capture: Frame #049
>> >         Video Capture: Frame #050
>> >         Video Capture: Frame #051
>> >         Video Capture: Frame #052
>> >         Video Capture: Frame #053
>> >         Video Capture: Frame #054
>> >         Video Capture: Frame #055
>> >         Video Capture: Frame #056
>> >         Video Capture: Frame #057
>> >         Video Capture: Frame #058
>> >         Video Capture: Frame #059
>> >
>> >         test MMAP (no poll, CREATE_BUFS): OK
>> >
>> >         Video Capture: Frame #000 (select)
>> >         Video Capture: Frame #001 (select)
>> >         Video Capture: Frame #002 (select)
>> >         Video Capture: Frame #003 (select)
>> >         Video Capture: Frame #004 (select)
>> >         Video Capture: Frame #005 (select)
>> >         Video Capture: Frame #006 (select)
>> >         Video Capture: Frame #007 (select)
>> >         Video Capture: Frame #008 (select)
>> >         Video Capture: Frame #009 (select)
>> >         Video Capture: Frame #010 (select)
>> >         Video Capture: Frame #011 (select)
>> >         Video Capture: Frame #012 (select)
>> >         Video Capture: Frame #013 (select)
>> >         Video Capture: Frame #014 (select)
>> >         Video Capture: Frame #015 (select)
>> >         Video Capture: Frame #016 (select)
>> >         Video Capture: Frame #017 (select)
>> >         Video Capture: Frame #018 (select)
>> >         Video Capture: Frame #019 (select)
>> >         Video Capture: Frame #020 (select)
>> >         Video Capture: Frame #021 (select)
>> >         Video Capture: Frame #022 (select)
>> >         Video Capture: Frame #023 (select)
>> >         Video Capture: Frame #024 (select)
>> >         Video Capture: Frame #025 (select)
>> >         Video Capture: Frame #026 (select)
>> >         Video Capture: Frame #027 (select)
>> >         Video Capture: Frame #028 (select)
>> >         Video Capture: Frame #029 (select)
>> >         Video Capture: Frame #030 (select)
>> >         Video Capture: Frame #031 (select)
>> >         Video Capture: Frame #032 (select)
>> >         Video Capture: Frame #033 (select)
>> >         Video Capture: Frame #034 (select)
>> >         Video Capture: Frame #035 (select)
>> >         Video Capture: Frame #036 (select)
>> >         Video Capture: Frame #037 (select)
>> >         Video Capture: Frame #038 (select)
>> >         Video Capture: Frame #039 (select)
>> >         Video Capture: Frame #040 (select)
>> >         Video Capture: Frame #041 (select)
>> >         Video Capture: Frame #042 (select)
>> >         Video Capture: Frame #043 (select)
>> >         Video Capture: Frame #044 (select)
>> >         Video Capture: Frame #045 (select)
>> >         Video Capture: Frame #046 (select)
>> >         Video Capture: Frame #047 (select)
>> >         Video Capture: Frame #048 (select)
>> >         Video Capture: Frame #049 (select)
>> >         Video Capture: Frame #050 (select)
>> >         Video Capture: Frame #051 (select)
>> >         Video Capture: Frame #052 (select)
>> >         Video Capture: Frame #053 (select)
>> >         Video Capture: Frame #054 (select)
>> >         Video Capture: Frame #055 (select)
>> >         Video Capture: Frame #056 (select)
>> >         Video Capture: Frame #057 (select)
>> >         Video Capture: Frame #058 (select)
>> >         Video Capture: Frame #059 (select)
>> >
>> >         test MMAP (select, CREATE_BUFS): OK
>> >
>> >         Video Capture: Frame #000 (epoll)
>> >         Video Capture: Frame #001 (epoll)
>> >         Video Capture: Frame #002 (epoll)
>> >         Video Capture: Frame #003 (epoll)
>> >         Video Capture: Frame #004 (epoll)
>> >         Video Capture: Frame #005 (epoll)
>> >         Video Capture: Frame #006 (epoll)
>> >         Video Capture: Frame #007 (epoll)
>> >         Video Capture: Frame #008 (epoll)
>> >         Video Capture: Frame #009 (epoll)
>> >         Video Capture: Frame #010 (epoll)
>> >         Video Capture: Frame #011 (epoll)
>> >         Video Capture: Frame #012 (epoll)
>> >         Video Capture: Frame #013 (epoll)
>> >         Video Capture: Frame #014 (epoll)
>> >         Video Capture: Frame #015 (epoll)
>> >         Video Capture: Frame #016 (epoll)
>> >         Video Capture: Frame #017 (epoll)
>> >         Video Capture: Frame #018 (epoll)
>> >         Video Capture: Frame #019 (epoll)
>> >         Video Capture: Frame #020 (epoll)
>> >         Video Capture: Frame #021 (epoll)
>> >         Video Capture: Frame #022 (epoll)
>> >         Video Capture: Frame #023 (epoll)
>> >         Video Capture: Frame #024 (epoll)
>> >         Video Capture: Frame #025 (epoll)
>> >         Video Capture: Frame #026 (epoll)
>> >         Video Capture: Frame #027 (epoll)
>> >         Video Capture: Frame #028 (epoll)
>> >         Video Capture: Frame #029 (epoll)
>> >         Video Capture: Frame #030 (epoll)
>> >         Video Capture: Frame #031 (epoll)
>> >         Video Capture: Frame #032 (epoll)
>> >         Video Capture: Frame #033 (epoll)
>> >         Video Capture: Frame #034 (epoll)
>> >         Video Capture: Frame #035 (epoll)
>> >         Video Capture: Frame #036 (epoll)
>> >         Video Capture: Frame #037 (epoll)
>> >         Video Capture: Frame #038 (epoll)
>> >         Video Capture: Frame #039 (epoll)
>> >         Video Capture: Frame #040 (epoll)
>> >         Video Capture: Frame #041 (epoll)
>> >         Video Capture: Frame #042 (epoll)
>> >         Video Capture: Frame #043 (epoll)
>> >         Video Capture: Frame #044 (epoll)
>> >         Video Capture: Frame #045 (epoll)
>> >         Video Capture: Frame #046 (epoll)
>> >         Video Capture: Frame #047 (epoll)
>> >         Video Capture: Frame #048 (epoll)
>> >         Video Capture: Frame #049 (epoll)
>> >         Video Capture: Frame #050 (epoll)
>> >         Video Capture: Frame #051 (epoll)
>> >         Video Capture: Frame #052 (epoll)
>> >         Video Capture: Frame #053 (epoll)
>> >         Video Capture: Frame #054 (epoll)
>> >         Video Capture: Frame #055 (epoll)
>> >         Video Capture: Frame #056 (epoll)
>> >         Video Capture: Frame #057 (epoll)
>> >         Video Capture: Frame #058 (epoll)
>> >         Video Capture: Frame #059 (epoll)
>> >
>> >         test MMAP (epoll, CREATE_BUFS): OK
>> >         test USERPTR (no poll): OK (Not Supported)
>> >         test USERPTR (select): OK (Not Supported)
>> >         test DMABUF (no poll): OK (Not Supported)
>> >         test DMABUF (select): OK (Not Supported)
>> >
>> > Total for uvcvideo device /dev/video0: 59, Succeeded: 58, Failed: 1, W=
arnings: 0
>> >
>> > ---
>> > Changes in v5:
>> > - Add DMA buffer alignment and padding for commands, responses, and th=
e event
>> >   buffer
>> > - Corrected styling of kernel-doc comments
>> > - Removed the configurable ``driver_name`` module parameter
>> > - Moved the protocol to ``include/uapi/linux/virtio_media.h``
>> > - Link to v4: https://lore.kernel.org/all/20260622204343.1994418-1-bri=
andaniels@google.com/
>> >
>> > Changes in v4:
>> > - Rebased on top of v7.1-rc1
>> > - Replace usages of filep->private_data with file_to_v4l2_fh()
>> >   throughout the driver
>> > - Link to v3: https://lore.kernel.org/r/20250412-virtio-media-v3-1-97d=
c94c18398@gmail.com
>> >
>> > Changes in v3:
>> > - Rebased on top of v6.15-rc1 and removes obsolete control callbacks.
>> > - Link to v2: https://lore.kernel.org/r/20250201-virtio-media-v2-1-ac8=
40681452d@gmail.com
>> >
>> > Changes in v2:
>> > - Fixed kernel test robot and media CI warnings (ignored a few false
>> >   positives).
>> > - Changed in-driver email address to personal one since my Google one
>> >   will soon become invalid.
>> > - Link to v1: https://lore.kernel.org/r/20250123-virtio-media-v1-1-81e=
2549b86b9@gmail.com
>> >
>> > Brian Daniels (5):
>> >   media: virtio: Add skeleton virtio-media driver
>> >   media: virtio: Add session management
>> >   media: virtio: Add scatterlist builder
>> >   media: virtio: Add ioctl operations and driver logic
>> >   media: virtio: Add USERPTR memory type support
>> >
>> >  MAINTAINERS                                |    8 +
>> >  drivers/media/Kconfig                      |   13 +
>> >  drivers/media/Makefile                     |    2 +
>> >  drivers/media/virtio/Makefile              |    7 +
>> >  drivers/media/virtio/scatterlist_builder.c |  579 +++++++++
>> >  drivers/media/virtio/scatterlist_builder.h |  112 ++
>> >  drivers/media/virtio/session.h             |  132 ++
>> >  drivers/media/virtio/virtio_media.h        |   97 ++
>> >  drivers/media/virtio/virtio_media_driver.c |  951 ++++++++++++++
>> >  drivers/media/virtio/virtio_media_ioctls.c | 1326 +++++++++++++++++++=
+
>> >  include/uapi/linux/virtio_media.h          |  287 +++++
>> >  11 files changed, 3514 insertions(+)
>> >  create mode 100644 drivers/media/virtio/Makefile
>> >  create mode 100644 drivers/media/virtio/scatterlist_builder.c
>> >  create mode 100644 drivers/media/virtio/scatterlist_builder.h
>> >  create mode 100644 drivers/media/virtio/session.h
>> >  create mode 100644 drivers/media/virtio/virtio_media.h
>> >  create mode 100644 drivers/media/virtio/virtio_media_driver.c
>> >  create mode 100644 drivers/media/virtio/virtio_media_ioctls.c
>> >  create mode 100644 include/uapi/linux/virtio_media.h
>> >
>> >
>> > base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
>> > --
>> > 2.55.0.229.g6434b31f56-goog
>> >
>>

