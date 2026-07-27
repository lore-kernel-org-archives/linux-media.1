Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDDD3CB54B
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 19:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785181374; cv=pass; b=mFMDEIUbVaQ9oL3ARZGBq6kSSHzUsHG0Tr/nsvaG5EOvJrhQIpYNZyIGW3xErJ1uzvhNCf2SXULedNYQKw7M3ongFBIzDdHzwRm66cpoH9IInyfAqlMZywoG2P6HwR6CnzQZVmzpiEyZ7EfED4AmWFKyFxXgt7KEEejPHWeq22I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785181374; c=relaxed/simple;
	bh=D7Xs2Gza3LNwIapmYcDyMfUT0hl+2t+VsE/Mkn/F7io=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OWDnzh3EXn7iGftmcqWD/hBwcCF8WYBLWfQuAW/8E0/Dow7JSIGLHhDfFg/z/nxyZPDrEK2LJG26wiDp3i6L/TGXm0HNzYGfQ1T3+q+XQNVMjKzy6B0XYnF2pYBtiyx5T+lmFz9eJZtGlFyVIJovoVm+nIpHZK8o78KQ1rjG/O4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxxJr+PK; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxxJr+PK"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38511175ad3so2125005a91.2
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 12:42:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785181370; cv=none;
        d=google.com; s=arc-20260327;
        b=AYqwxuNpITVnVeLk4iV4erflRQpY5ZIpFYelnplfy/J/Fa/bVth1WqrdW1AHUCCDHK
         9VrSnQ8Gs/LcmvdEbMxuN4MeLfWONTyXQDq2zRThXv5Tf53rfCMw5l56d0MGz0E+7DF2
         CzYZWU1QoqSHIn3fzNO2x7njBOC1QA8JigQGC/gIr+xFNAwqyb/wat/8mIN5uzDsp1f4
         6pflwkbt+AVyqIOGq9yBs2lwXr7uLXOYOeix1qh0F1mMdOz6q9TGxauxgwbOwkqcr8P7
         J2ZMFZ9oz2lGSsYCYtWxcqol8qv7lWAYomoqRCUhnpmipBio5dY/XuyKJ9IMXPcSaXUq
         LCpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rDZ9DyQ5vpmFv08laqlmbrotiO6/u4VTZhp8UW5cals=;
        fh=T/sH+T80uE/PuRVFtwh7ozcgCEeFko0mXZVb+HbvnXs=;
        b=iwDjIsS7nycuA+TRU2O2GZ+HbhtlIzFQPbgJLXt3Rt1Jkc7XWqY/cEdk8LgOoP4Ro8
         Ci1KH/l1ZR+EAqA5Roc/J5gPa3ynylPQdeUIJ+pNg5U1Ckcs2E6dRlT1YpqX8z5RMCmn
         IrAEa+VSYvuFkrOQi9Fvl/KgFKeZBqQywfLJJHkrISWflggTyGDQ25QwYNBm1q3dksE+
         oqWxoiI4B9dwpNzNiHOqNO/5Y40qz1g/0XWoslQeRfc0yS0ebDZsALUJ8iYWiW5OGpjT
         5gU8jwV8VAv6KOgX38x2aushNQ9KOPiMdO45UgnGf/fF/GIW8fHU6UmmDa8Uff7nTjFj
         H67g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785181370; x=1785786170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rDZ9DyQ5vpmFv08laqlmbrotiO6/u4VTZhp8UW5cals=;
        b=jxxJr+PKKn9MTwFh+MdeMuZ7Mps8TsEjhAKJgkefJyCP6GlSyFqPIPCnltTbLdcgOX
         wDT56F0YOBVZPKkNiWNc7itnW/xf3WDVlTnQQ4C0igJRkbLyfF7H84ycnYrcID2yC7HM
         pRtzSBwZY7J74zk1db/U0oAtOH+vLgQibIZvxENB/lkv1Gy8rTj25Ukvmxj2bVKYjTcd
         3W1O+klDbtRsuGVudFpM0nWUUc6cx/1r7N4bocYMwnUzAJhsSkX1x8qO1MS40QRqP0aE
         g/0qBWUzOlZczbqqJqNtRerO6hpxjwJO8Ds0NN5zyJIKxDZ9nh2Xhe4UIpCmakGsR/pX
         OVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785181370; x=1785786170;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rDZ9DyQ5vpmFv08laqlmbrotiO6/u4VTZhp8UW5cals=;
        b=WtKGle8x8M5eZYujBrf3LbU5485OOowjHmZvsKJDmGOL27epfwyy1SrWW9ns3UAplf
         OISfMvuA6KLKjoRlNTjkYXUh3b29Yq6BS7evGTJfzkTnDpATr0d0dq2gJqmX5NXi7EXw
         ThhjkwZoQExeUl+SQP7AsnHU6DGnkAZxV8Vsx+Td+ddf6ryTDszNQeLcK353dB1525Cq
         Hg8BAhFdPq8IkN2Bud06N3hDiTkYAa4Qpy1QPAxrLWl3qONtXVN9BO8+YTQSa1ENa4mR
         7aGicawpqBdHrTv3AcMHc6mB6Y7KcGzEl1W3CpcrvrfQo9vRB/mT33S0m+8NvQeZ26Pz
         zL3Q==
X-Forwarded-Encrypted: i=1; AHgh+RpJ3j56v0Rx+SZtL9hLBqzckDDkzUftn9f1i1QSH1vdysC3FQ52F4CdXx/bW+rGqVEju6Byn/sur7Erlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWgyQQzM8Np6cDUG3XVfpy1yuYZuHVNKPkF5eAqGs75tOOCcaw
	sTpyKJKnUbPYnPgzsqTCdVYdrZP4d+JLhGhUlvr81sixB7BY2hjO2ZXmhGNl752XuO0cXlg+dEI
	oTmDzQU0GuqoU0nhLZO2aqhdmLxO2XZBwOZ3R
X-Gm-Gg: AR+sD125ZTV7cO4xG2g1t4q8viFBtSnMNFaB9T4/wWqtGA08JoJsZISKCzf4717lpPT
	S0V4aDu5L/29d1SDBhcmDtkwRtojiu3tWiBOEaQZuWHufIJwQzz+ciMBauOMij5IoNy2hRgHkIg
	stdIBLE7aHaFnebJ8Qrt4FYJ1oU8JgmFLyTRVP3mCzTiMRzYsi3hLi7RV7WCKzriyF4NbgVtpom
	wk3l7vFBWkFLzJRmLFB0x0IiXmyPglNTXIvAwITnxSOkc4e2ZWZ/vgKvAVa
X-Received: by 2002:a05:6a20:4391:b0:3c3:8bab:804 with SMTP id
 adf61e73a8af0-3c6c7d8e61bmr918106637.49.1785181370003; Mon, 27 Jul 2026
 12:42:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629182649.247879-1-hoff.benjamin.k@gmail.com>
 <20260629182649.247879-3-hoff.benjamin.k@gmail.com> <30e9aed1-d2ae-4e41-abf1-7b3aba7664be@kernel.org>
In-Reply-To: <30e9aed1-d2ae-4e41-abf1-7b3aba7664be@kernel.org>
From: Ben Hoff <hoff.benjamin.k@gmail.com>
Date: Mon, 27 Jul 2026 15:42:38 -0400
X-Gm-Features: AUfX_mxJmqUef7YAHcoI5SDDDFrxjMaLrZO-tOYyv8prAz3cvQ-4qDiR0mEZ7z4
Message-ID: <CAMSzxxQh94hz4h8jd2_qSFw849dTRO-EK8TjL6f=5aEqyOPB1Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] media: hws: add shared scratch DMA arena
To: hverkuil+cisco@kernel.org
Cc: mchehab@kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

The =E2=80=9CChanges Requested=E2=80=9D state is correct. I interpreted you=
r July 15
feedback as requiring a new version of the series, and I have
additional changes coming across the patchset.

I have a new revision drafted locally, but I want to test it more
thoroughly before sending it.

Happy to get feedback on any component of this patchset as well and I
can fold that in as well.

Best,
Ben


On Mon, Jul 27, 2026 at 11:07=E2=80=AFAM <hverkuil+cisco@kernel.org> wrote:
>
> Hi Ben,
>
> On 29/06/2026 20:26, hoff.benjamin.k@gmail.com wrote:
> > From: Ben Hoff <hoff.benjamin.k@gmail.com>
> >
> > Replace the probe-time seed buffer allocation with a per-channel cohere=
nt
> > scratch arena that is acquired by stream users and released by refcount=
.
> > The arena reserves video bounce space first and an audio capture window
> > after it, and validates that the full allocation fits within the single
> > 512 MiB BAR remap page shared by the channel.
> >
> > Reset cached video DMA window state when freeing a channel arena so the
> > next stream reprograms the hardware from a clean state.
>
> This patch is marked as 'Changes Requested' in patchwork:
>
> https://patchwork.linuxtv.org/project/linux-media/patch/20260629182649.24=
7879-3-hoff.benjamin.k@gmail.com/
>
> I suspect that's a mistake. Can you confirm that the patchwork state shou=
ld really
> be 'New'? Or are there really more changes coming and I just missed somet=
hing?
>
> Regards,
>
>         Hans
>
> >
> > Signed-off-by: Ben Hoff <hoff.benjamin.k@gmail.com>
> > ---
> >  drivers/media/pci/hws/hws.h       |  28 +++++
> >  drivers/media/pci/hws/hws_pci.c   | 192 ++++++++++++++++++++++++------
> >  drivers/media/pci/hws/hws_reg.h   |   7 ++
> >  drivers/media/pci/hws/hws_video.c |  17 +--
> >  4 files changed, 198 insertions(+), 46 deletions(-)
> >
> > diff --git a/drivers/media/pci/hws/hws.h b/drivers/media/pci/hws/hws.h
> > index 8fbe1fe27844..c0541190c047 100644
> > --- a/drivers/media/pci/hws/hws.h
> > +++ b/drivers/media/pci/hws/hws.h
> > @@ -8,6 +8,7 @@
> >  #include <linux/kthread.h>
> >  #include <linux/pci.h>
> >  #include <linux/list.h>
> > +#include <linux/mutex.h>
> >  #include <linux/spinlock.h>
> >  #include <linux/sizes.h>
> >  #include <linux/atomic.h>
> > @@ -52,6 +53,8 @@ struct hwsvideo_buffer {
> >       int slot;
> >  };
> >
> > +#define HWS_VIDEO_BOUNCE_SLOTS 2
> > +
> >  struct hws_video {
> >       /* Linkage */
> >       struct hws_pcie_dev *parent;
> > @@ -104,6 +107,7 @@ struct hws_video {
> >       u32 last_dma_page;
> >       u32 last_pci_addr;
> >       u32 last_half16;
> > +     u8 next_bounce_slot;
> >
> >       /* Misc counters */
> >       int signal_loss_cnt;
> > @@ -130,6 +134,7 @@ struct hws_scratch_dma {
> >       void *cpu;
> >       dma_addr_t dma;
> >       size_t size;
> > +     bool owned;
> >  };
> >
> >  struct hws_pcie_dev {
> > @@ -152,6 +157,7 @@ struct hws_pcie_dev {
> >       u32 max_hw_video_buf_sz;
> >       u8 max_channels;
> >       u8 cur_max_video_ch;
> > +     u8 cur_max_audio_ch;
> >       bool start_run;
> >
> >       bool buf_allocated;
> > @@ -161,7 +167,10 @@ struct hws_pcie_dev {
> >
> >       /* Kernel thread */
> >       struct task_struct *main_task;
> > +     struct mutex scratch_lock; /* protects scratch DMA arenas and use=
r refs */
> > +     unsigned int scratch_users[MAX_VID_CHANNELS];
> >       struct hws_scratch_dma scratch_vid[MAX_VID_CHANNELS];
> > +     struct hws_scratch_dma scratch_aud[MAX_VID_CHANNELS];
> >
> >       bool suspended;
> >       int irq;
> > @@ -170,4 +179,23 @@ struct hws_pcie_dev {
> >       int pci_lost;
> >  };
> >
> > +static inline bool hws_dma_fits_remap_window(dma_addr_t dma, size_t si=
ze)
> > +{
> > +     dma_addr_t end;
> > +
> > +     if (!size)
> > +             return false;
> > +
> > +     end =3D dma + size - 1;
> > +     if (end < dma)
> > +             return false;
> > +
> > +     return upper_32_bits(dma) =3D=3D upper_32_bits(end) &&
> > +            (lower_32_bits(dma) & PCI_E_BAR_ADD_MASK) =3D=3D
> > +            (lower_32_bits(end) & PCI_E_BAR_ADD_MASK);
> > +}
> > +
> > +int hws_alloc_channel_scratch(struct hws_pcie_dev *hws, unsigned int c=
h);
> > +void hws_release_channel_scratch(struct hws_pcie_dev *hws, unsigned in=
t ch);
> > +
> >  #endif
> > diff --git a/drivers/media/pci/hws/hws_pci.c b/drivers/media/pci/hws/hw=
s_pci.c
> > index 10af6c30566a..589d4840e116 100644
> > --- a/drivers/media/pci/hws/hws_pci.c
> > +++ b/drivers/media/pci/hws/hws_pci.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/err.h>
> >  #include <linux/ktime.h>
> >  #include <linux/math64.h>
> > +#include <linux/minmax.h>
> >  #include <linux/pm.h>
> >  #include <linux/freezer.h>
> >  #include <linux/pci_regs.h>
> > @@ -101,22 +102,30 @@ static void hws_configure_hardware_capabilities(s=
truct hws_pcie_dev *hdev)
> >       case 0x8504:
> >       case 0x6504:
> >               hdev->cur_max_video_ch =3D 4;
> > +             hdev->cur_max_audio_ch =3D 4;
> >               break;
> >       case 0x8532:
> >               hdev->cur_max_video_ch =3D 2;
> > +             hdev->cur_max_audio_ch =3D 2;
> >               break;
> >       case 0x8512:
> >       case 0x6502:
> >               hdev->cur_max_video_ch =3D 2;
> > +             hdev->cur_max_audio_ch =3D 0;
> >               break;
> >       case 0x8501:
> >               hdev->cur_max_video_ch =3D 1;
> > +             hdev->cur_max_audio_ch =3D 0;
> >               break;
> >       default:
> >               hdev->cur_max_video_ch =3D 4;
> > +             hdev->cur_max_audio_ch =3D 0;
> >               break;
> >       }
> >
> > +     if (hdev->cur_max_audio_ch > hdev->cur_max_video_ch)
> > +             hdev->cur_max_audio_ch =3D hdev->cur_max_video_ch;
> > +
> >       /* universal buffer capacity */
> >       hdev->max_hw_video_buf_sz =3D MAX_MM_VIDEO_SIZE;
> >
> > @@ -255,55 +264,164 @@ static void hws_stop_kthread_action(void *data)
> >       }
> >  }
> >
> > -static int hws_alloc_seed_buffers(struct hws_pcie_dev *hws)
> > +static size_t hws_video_scratch_bytes(void)
> >  {
> > -     int ch;
> > -     /* 64 KiB is plenty for a safe dummy; hardware needs 64-byte alig=
nment. */
> > -     const size_t need =3D ALIGN(64 * 1024, 64);
> > +     return HWS_VIDEO_BOUNCE_SLOTS * ALIGN((size_t)MAX_VIDEO_SCALER_SI=
ZE, 64);
> > +}
> >
> > -     for (ch =3D 0; ch < hws->cur_max_video_ch; ch++) {
> > +static size_t hws_audio_scratch_bytes(void)
> > +{
> > +     return ALIGN((size_t)MAX_AUDIO_CAP_SIZE, 64);
> > +}
> > +
> > +static void hws_clear_scratch(struct hws_scratch_dma *scratch)
> > +{
> > +     scratch->cpu =3D NULL;
> > +     scratch->dma =3D 0;
> > +     scratch->size =3D 0;
> > +     scratch->owned =3D false;
> > +}
> > +
> > +static void hws_free_channel_scratch_locked(struct hws_pcie_dev *hws,
> > +                                         unsigned int ch)
> > +{
> > +     struct hws_scratch_dma *vid;
> > +     struct hws_scratch_dma *aud;
> > +
> > +     if (!hws || ch >=3D MAX_VID_CHANNELS)
> > +             return;
> > +
> > +     vid =3D &hws->scratch_vid[ch];
> > +     aud =3D &hws->scratch_aud[ch];
> > +
> > +     if (ch < hws->cur_max_video_ch) {
> > +             hws->video[ch].window_valid =3D false;
> > +             hws->video[ch].last_dma_hi =3D 0;
> > +             hws->video[ch].last_dma_page =3D 0;
> > +             hws->video[ch].last_pci_addr =3D 0;
> > +             hws->video[ch].last_half16 =3D 0;
> > +             hws->video[ch].next_bounce_slot =3D 0;
> > +     }
> > +     hws->scratch_users[ch] =3D 0;
> > +
> > +     if (aud->cpu && aud->owned)
> > +             dma_free_coherent(&hws->pdev->dev, aud->size, aud->cpu,
> > +                               aud->dma);
> > +     hws_clear_scratch(aud);
> > +
> > +     if (vid->cpu && vid->owned)
> > +             dma_free_coherent(&hws->pdev->dev, vid->size, vid->cpu,
> > +                               vid->dma);
> > +     hws_clear_scratch(vid);
> > +}
> > +
> > +int hws_alloc_channel_scratch(struct hws_pcie_dev *hws, unsigned int c=
h)
> > +{
> > +     size_t aud_off =3D hws_video_scratch_bytes();
> > +     size_t arena_need =3D aud_off;
> > +     bool has_audio;
> > +
> > +     if (!hws || ch >=3D max_t(unsigned int, hws->cur_max_video_ch,
> > +                             hws->cur_max_audio_ch))
> > +             return -EINVAL;
> > +
> > +     has_audio =3D ch < hws->cur_max_audio_ch;
> > +     if (has_audio)
> > +             arena_need =3D ALIGN(aud_off + hws_audio_scratch_bytes(),=
 64);
> > +
> > +     /*
> > +      * One coherent per-channel arena backs both fallback video DMA a=
nd audio
> > +      * DMA. The video bounce slots live first; the audio capture wind=
ow starts
> > +      * at aud_off. The whole arena must fit inside a single 512 MiB r=
emap page
> > +      * because video and audio share the channel remap slot.
> > +      */
> > +     mutex_lock(&hws->scratch_lock);
> > +     if (hws->scratch_vid[ch].cpu) {
> > +             hws->scratch_users[ch]++;
> > +             mutex_unlock(&hws->scratch_lock);
> > +             return 0;
> > +     }
> > +
> > +     {
> >  #if defined(CONFIG_HAS_DMA) /* normal on PCIe platforms */
> > -             void *cpu =3D dma_alloc_coherent(&hws->pdev->dev, need,
> > -                                            &hws->scratch_vid[ch].dma,
> > -                                            GFP_KERNEL);
> > +             dma_addr_t dma =3D 0;
> > +             void *cpu =3D NULL;
> > +             int attempt;
> > +
> > +             for (attempt =3D 0; attempt < 8; attempt++) {
> > +                     cpu =3D dma_alloc_coherent(&hws->pdev->dev, arena=
_need,
> > +                                              &dma, GFP_KERNEL);
> > +                     if (!cpu)
> > +                             break;
> > +                     if (!hws_dma_fits_remap_window(dma, arena_need)) =
{
> > +                             dev_dbg(&hws->pdev->dev,
> > +                                     "scratch arena: retry ch=3D%u dma=
=3D%pad size=3D%zu crosses remap window\n",
> > +                                     ch, &dma, arena_need);
> > +                             dma_free_coherent(&hws->pdev->dev, arena_=
need,
> > +                                               cpu, dma);
> > +                             cpu =3D NULL;
> > +                             continue;
> > +                     }
> > +                     break;
> > +             }
> >  #else
> >               void *cpu =3D NULL;
> > +             dma_addr_t dma =3D 0;
> >  #endif
> >               if (!cpu) {
> >                       dev_warn(&hws->pdev->dev,
> > -                              "scratch: dma_alloc_coherent failed ch=
=3D%d\n", ch);
> > -                     /* not fatal: free earlier ones and continue with=
out seeding */
> > -                     while (--ch >=3D 0) {
> > -                             if (hws->scratch_vid[ch].cpu)
> > -                                     dma_free_coherent(&hws->pdev->dev=
,
> > -                                                       hws->scratch_vi=
d[ch].size,
> > -                                                       hws->scratch_vi=
d[ch].cpu,
> > -                                                       hws->scratch_vi=
d[ch].dma);
> > -                             hws->scratch_vid[ch].cpu =3D NULL;
> > -                             hws->scratch_vid[ch].size =3D 0;
> > -                     }
> > +                              "scratch arena: dma_alloc_coherent faile=
d ch=3D%u\n",
> > +                              ch);
> > +                     mutex_unlock(&hws->scratch_lock);
> >                       return -ENOMEM;
> >               }
> > -             hws->scratch_vid[ch].cpu  =3D cpu;
> > -             hws->scratch_vid[ch].size =3D need;
> > +
> > +             hws->scratch_vid[ch].dma =3D dma;
> > +             hws->scratch_vid[ch].cpu =3D cpu;
> > +             hws->scratch_vid[ch].size =3D arena_need;
> > +             hws->scratch_vid[ch].owned =3D true;
> > +
> > +             if (has_audio) {
> > +                     hws->scratch_aud[ch].dma =3D dma + aud_off;
> > +                     hws->scratch_aud[ch].cpu =3D (u8 *)cpu + aud_off;
> > +                     hws->scratch_aud[ch].size =3D hws_audio_scratch_b=
ytes();
> > +                     hws->scratch_aud[ch].owned =3D false;
> > +             }
> >       }
> > +     hws->scratch_users[ch] =3D 1;
> > +
> > +     dev_dbg(&hws->pdev->dev,
> > +             "scratch arena: allocated ch=3D%u size=3D%zu audio=3D%d\n=
",
> > +             ch, arena_need, has_audio);
> > +     mutex_unlock(&hws->scratch_lock);
> >       return 0;
> >  }
> >
> > +void hws_release_channel_scratch(struct hws_pcie_dev *hws, unsigned in=
t ch)
> > +{
> > +     if (!hws || ch >=3D MAX_VID_CHANNELS)
> > +             return;
> > +
> > +     mutex_lock(&hws->scratch_lock);
> > +     if (hws->scratch_users[ch] > 0)
> > +             hws->scratch_users[ch]--;
> > +     if (!hws->scratch_users[ch])
> > +             hws_free_channel_scratch_locked(hws, ch);
> > +     mutex_unlock(&hws->scratch_lock);
> > +}
> > +
> >  static void hws_free_seed_buffers(struct hws_pcie_dev *hws)
> >  {
> >       int ch;
> >
> > -     for (ch =3D 0; ch < hws->cur_max_video_ch; ch++) {
> > -             if (hws->scratch_vid[ch].cpu) {
> > -                     dma_free_coherent(&hws->pdev->dev,
> > -                                       hws->scratch_vid[ch].size,
> > -                                       hws->scratch_vid[ch].cpu,
> > -                                       hws->scratch_vid[ch].dma);
> > -                     hws->scratch_vid[ch].cpu =3D NULL;
> > -                     hws->scratch_vid[ch].size =3D 0;
> > -             }
> > -     }
> > +     if (!hws)
> > +             return;
> > +
> > +     /* Teardown-only force-free path; normal streams use release refc=
ounts. */
> > +     mutex_lock(&hws->scratch_lock);
> > +     for (ch =3D 0; ch < MAX_VID_CHANNELS; ch++)
> > +             hws_free_channel_scratch_locked(hws, ch);
> > +     mutex_unlock(&hws->scratch_lock);
> >  }
> >
> >  static void hws_seed_channel(struct hws_pcie_dev *hws, int ch)
> > @@ -326,11 +444,11 @@ static void hws_seed_channel(struct hws_pcie_dev =
*hws, int ch)
> >                      hws->bar0_base + CVBS_IN_BUF_BASE +
> >                      ch * PCIE_BARADDROFSIZE);
> >
> > -     /* Half size: use either the current format's half or half of scr=
atch. */
> > +     /* Half size: use either the current format or the video arena. *=
/
> >       {
> >               u32 half =3D hws->video[ch].pix.half_size ?
> >                       hws->video[ch].pix.half_size :
> > -                     (u32)(hws->scratch_vid[ch].size / 2);
> > +                     (u32)(MAX_VIDEO_SCALER_SIZE / 2);
> >
> >               writel_relaxed(half / 16,
> >                              hws->bar0_base + CVBS_IN_BUF_BASE2 +
> > @@ -400,6 +518,7 @@ static int hws_probe(struct pci_dev *pdev, const st=
ruct pci_device_id *pci_id)
> >       hws->pdev =3D pdev;
> >       hws->irq =3D -1;
> >       hws->suspended =3D false;
> > +     mutex_init(&hws->scratch_lock);
> >       pci_set_drvdata(pdev, hws);
> >
> >       /* 1) Enable device + bus mastering (managed) */
> > @@ -448,12 +567,7 @@ static int hws_probe(struct pci_dev *pdev, const s=
truct pci_device_id *pci_id)
> >               }
> >       }
> >
> > -     /* 6) Allocate scratch DMA and seed BAR table + channel base/half=
 (legacy SetDMAAddress) */
> > -     ret =3D hws_alloc_seed_buffers(hws);
> > -     if (!ret)
> > -             hws_seed_all_channels(hws);
> > -
> > -     /* 7) Start-run sequence. */
> > +     /* 6) Start-run sequence. Scratch DMA is allocated on stream star=
t. */
> >       hws_init_video_sys(hws, false);
> >
> >       /* A) Force legacy INTx; legacy used request_irq(pdev->irq, ..., =
IRQF_SHARED) */
> > diff --git a/drivers/media/pci/hws/hws_reg.h b/drivers/media/pci/hws/hw=
s_reg.h
> > index 344cb8d011a9..c8d6715fe0c2 100644
> > --- a/drivers/media/pci/hws/hws_reg.h
> > +++ b/drivers/media/pci/hws/hws_reg.h
> > @@ -33,6 +33,13 @@
> >  #define PCI_E_BAR_ADD_MASK 0xE0000000
> >  #define PCI_E_BAR_ADD_LOWMASK 0x1FFFFFFF
> >
> > +/*
> > + * The legacy driver reserved a 10 KiB hardware capture window per aud=
io
> > + * channel even though the delivered packet size is smaller. Keep that=
 headroom
> > + * for the split-buffer DMA engine.
> > + */
> > +#define MAX_AUDIO_CAP_SIZE         (10U * 1024U)
> > +
> >  #define MAX_VID_CHANNELS            4
> >
> >  #define MAX_MM_VIDEO_SIZE            SZ_4M
> > diff --git a/drivers/media/pci/hws/hws_video.c b/drivers/media/pci/hws/=
hws_video.c
> > index b1af81d1368a..1531d703f6d8 100644
> > --- a/drivers/media/pci/hws/hws_video.c
> > +++ b/drivers/media/pci/hws/hws_video.c
> > @@ -306,6 +306,7 @@ int hws_video_init_channel(struct hws_pcie_dev *pde=
v, int ch)
> >
> >       vid->queued_count =3D 0;
> >       vid->window_valid =3D false;
> > +     vid->next_bounce_slot =3D 0;
> >
> >       /* Default format. */
> >       vid->pix.width =3D 1920;
> > @@ -556,17 +557,18 @@ static void hws_seed_dma_windows(struct hws_pcie_=
dev *hws)
> >                                      hws->bar0_base + CVBS_IN_BUF_BASE =
+
> >                                      ch * PCIE_BARADDROFSIZE);
> >
> > -                     /* Half-frame length in /16 units.
> > -                      * Prefer the current channel's computed half_siz=
e if available.
> > -                      * Fall back to half of the probe-owned scratch b=
uffer.
> > +                     /*
> > +                      * Half-frame length in /16 units. Prefer the cur=
rent
> > +                      * format and fall back to the video bounce windo=
w,
> > +                      * not the full per-channel arena that also conta=
ins audio.
> >                        */
> >                       {
> >                               u32 half_bytes =3D hws->video[ch].pix.hal=
f_size ?
> > -                                 hws->video[ch].pix.half_size :
> > -                                 (u32)(hws->scratch_vid[ch].size / 2);
> > +                                     hws->video[ch].pix.half_size :
> > +                                     (u32)(MAX_VIDEO_SCALER_SIZE / 2);
> > +
> >                               writel_relaxed(half_bytes / 16,
> > -                                            hws->bar0_base +
> > -                                            CVBS_IN_BUF_BASE2 +
> > +                                            hws->bar0_base + CVBS_IN_B=
UF_BASE2 +
> >                                              ch * PCIE_BARADDROFSIZE);
> >                       }
> >               }
> > @@ -1166,6 +1168,7 @@ static int hws_start_streaming(struct vb2_queue *=
q, unsigned int count)
> >               }
> >               return ret;
> >       }
> > +
> >       (void)hws_read_active_state(hws, v->channel_index,
> >                                      &v->pix.interlaced);
> >
>
