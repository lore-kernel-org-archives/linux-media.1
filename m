Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A219828C009;
	Wed, 15 Jul 2026 15:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784128251; cv=none; b=rul3TTd+HsQGSBGiMjjFg8okvp+ig5jYiudptOYEpIp68xKFWmvsCx5gZAQ684O346+SV6iRk7EiYHjfRrLPJSjCE9YokyRcCp7+jOZ6BsE+dFG/6lVcd1TF6jMdOA8vovfbg+QiuJPRxDZwLspw6gfRU5QIByrG/7QXmTJEqNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784128251; c=relaxed/simple;
	bh=HMKZCmhXJAHVMLW3Hki7KReMtsxMRjJT03aNjgfVqwU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=EBbnIfcOD5xYVWoAFWerDzr8PR0mEvhkpSZNle67pVVvQ2ZY+mpmolAI8Rmh56uJntfHwZCN01Shz3zG5QNbBC6iw5x6MmuOvWz+pTImWdjr4aphtNBWial2gXMkodd0t8bobemRCph5SUFx9juW1cAYl/wYOp4Wc/Hp+FnGa7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jvSpM8KP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jvSpM8KP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7175B1F000E9;
	Wed, 15 Jul 2026 15:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784128249;
	bh=sdJPZBnxQAkl9u0CXs7JXPb1ALr3dLqlXhqVtNNPZ3s=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=jvSpM8KP7dL+uHoFvU4CY4nk5XtyCUUh0FGPGt1mBTTX+WICTlDFE4PNkpgfuvS0w
	 DkVuZDiPjn7Y4NA6JpHvWoZfIAPllo2iuuyp2XkmF9CpxRLY8axS2zmCNgmmz+oUpe
	 VCiorektVxlcEHUCYbXFcKJw0XjuJvdxM97Ako6LxxAsBGC7vKs51vK5UVCwDsPnAd
	 kffji4ed2x7mEflcggPV3OisSWRHVT8lN72T2GdqCvXj2hpSbAPYaBh4eQQptxA+yo
	 07JzUx1ziWVIROBfJwQBBTg+8Sy7De66VNzkbYf1kczQFAh0hq/Z8jI1m7x7XUbhv9
	 ANrXncW8cBs8g==
Message-ID: <0a376c01-db08-4907-9cb6-3b5dd1c2dcb8@kernel.org>
Date: Wed, 15 Jul 2026 17:10:46 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hverkuil+cisco@kernel.org
Subject: Re: [PATCH v2 2/5] media: hws: add shared scratch DMA arena
To: hoff.benjamin.k@gmail.com, mchehab@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260629160304.154046-1-hoff.benjamin.k@gmail.com>
 <20260629160304.154046-3-hoff.benjamin.k@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260629160304.154046-3-hoff.benjamin.k@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ben,

On 29/06/2026 18:03, hoff.benjamin.k@gmail.com wrote:
> From: Ben Hoff <hoff.benjamin.k@gmail.com>
> 
> Replace the probe-time seed buffer allocation with a per-channel coherent scratch arena that is acquired by stream users and released by refcount. The arena reserves video bounce space first and an audio capture window after it, and validates that the full allocation fits within the single 512 MiB BAR remap page shared by the channel.
> 
> Reset cached video DMA window state when freeing a channel arena so the next stream reprograms the hardware from a clean state.
> 
> Signed-off-by: Ben Hoff <hoff.benjamin.k@gmail.com>
> ---
>  drivers/media/pci/hws/hws.h       |  28 +++++
>  drivers/media/pci/hws/hws_pci.c   | 192 ++++++++++++++++++++++++------
>  drivers/media/pci/hws/hws_reg.h   |   7 ++
>  drivers/media/pci/hws/hws_video.c |  17 +--
>  4 files changed, 198 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/media/pci/hws/hws.h b/drivers/media/pci/hws/hws.h
> index 8fbe1fe27844..c0541190c047 100644
> --- a/drivers/media/pci/hws/hws.h
> +++ b/drivers/media/pci/hws/hws.h
> @@ -8,6 +8,7 @@
>  #include <linux/kthread.h>
>  #include <linux/pci.h>
>  #include <linux/list.h>
> +#include <linux/mutex.h>
>  #include <linux/spinlock.h>
>  #include <linux/sizes.h>
>  #include <linux/atomic.h>
> @@ -52,6 +53,8 @@ struct hwsvideo_buffer {
>  	int slot;
>  };
>  
> +#define HWS_VIDEO_BOUNCE_SLOTS 2
> +
>  struct hws_video {
>  	/* Linkage */
>  	struct hws_pcie_dev *parent;
> @@ -104,6 +107,7 @@ struct hws_video {
>  	u32 last_dma_page;
>  	u32 last_pci_addr;
>  	u32 last_half16;
> +	u8 next_bounce_slot;
>  
>  	/* Misc counters */
>  	int signal_loss_cnt;
> @@ -130,6 +134,7 @@ struct hws_scratch_dma {
>  	void *cpu;
>  	dma_addr_t dma;
>  	size_t size;
> +	bool owned;
>  };
>  
>  struct hws_pcie_dev {
> @@ -152,6 +157,7 @@ struct hws_pcie_dev {
>  	u32 max_hw_video_buf_sz;
>  	u8 max_channels;
>  	u8 cur_max_video_ch;
> +	u8 cur_max_audio_ch;
>  	bool start_run;
>  
>  	bool buf_allocated;
> @@ -161,7 +167,10 @@ struct hws_pcie_dev {
>  
>  	/* Kernel thread */
>  	struct task_struct *main_task;
> +	struct mutex scratch_lock; /* protects scratch DMA arenas and user refs */
> +	unsigned int scratch_users[MAX_VID_CHANNELS];
>  	struct hws_scratch_dma scratch_vid[MAX_VID_CHANNELS];
> +	struct hws_scratch_dma scratch_aud[MAX_VID_CHANNELS];
>  
>  	bool suspended;
>  	int irq;
> @@ -170,4 +179,23 @@ struct hws_pcie_dev {
>  	int pci_lost;
>  };
>  
> +static inline bool hws_dma_fits_remap_window(dma_addr_t dma, size_t size)
> +{
> +	dma_addr_t end;
> +
> +	if (!size)
> +		return false;
> +
> +	end = dma + size - 1;
> +	if (end < dma)
> +		return false;
> +
> +	return upper_32_bits(dma) == upper_32_bits(end) &&
> +	       (lower_32_bits(dma) & PCI_E_BAR_ADD_MASK) ==
> +	       (lower_32_bits(end) & PCI_E_BAR_ADD_MASK);
> +}
> +
> +int hws_alloc_channel_scratch(struct hws_pcie_dev *hws, unsigned int ch);
> +void hws_release_channel_scratch(struct hws_pcie_dev *hws, unsigned int ch);
> +
>  #endif
> diff --git a/drivers/media/pci/hws/hws_pci.c b/drivers/media/pci/hws/hws_pci.c
> index 10af6c30566a..589d4840e116 100644
> --- a/drivers/media/pci/hws/hws_pci.c
> +++ b/drivers/media/pci/hws/hws_pci.c
> @@ -11,6 +11,7 @@
>  #include <linux/err.h>
>  #include <linux/ktime.h>
>  #include <linux/math64.h>
> +#include <linux/minmax.h>
>  #include <linux/pm.h>
>  #include <linux/freezer.h>
>  #include <linux/pci_regs.h>
> @@ -101,22 +102,30 @@ static void hws_configure_hardware_capabilities(struct hws_pcie_dev *hdev)
>  	case 0x8504:
>  	case 0x6504:
>  		hdev->cur_max_video_ch = 4;
> +		hdev->cur_max_audio_ch = 4;
>  		break;
>  	case 0x8532:
>  		hdev->cur_max_video_ch = 2;
> +		hdev->cur_max_audio_ch = 2;
>  		break;
>  	case 0x8512:
>  	case 0x6502:
>  		hdev->cur_max_video_ch = 2;
> +		hdev->cur_max_audio_ch = 0;
>  		break;
>  	case 0x8501:
>  		hdev->cur_max_video_ch = 1;
> +		hdev->cur_max_audio_ch = 0;
>  		break;
>  	default:
>  		hdev->cur_max_video_ch = 4;
> +		hdev->cur_max_audio_ch = 0;
>  		break;
>  	}
>  
> +	if (hdev->cur_max_audio_ch > hdev->cur_max_video_ch)
> +		hdev->cur_max_audio_ch = hdev->cur_max_video_ch;
> +
>  	/* universal buffer capacity */
>  	hdev->max_hw_video_buf_sz = MAX_MM_VIDEO_SIZE;
>  
> @@ -255,55 +264,164 @@ static void hws_stop_kthread_action(void *data)
>  	}
>  }
>  
> -static int hws_alloc_seed_buffers(struct hws_pcie_dev *hws)
> +static size_t hws_video_scratch_bytes(void)
>  {
> -	int ch;
> -	/* 64 KiB is plenty for a safe dummy; hardware needs 64-byte alignment. */
> -	const size_t need = ALIGN(64 * 1024, 64);
> +	return HWS_VIDEO_BOUNCE_SLOTS * ALIGN((size_t)MAX_VIDEO_SCALER_SIZE, 64);
> +}
>  
> -	for (ch = 0; ch < hws->cur_max_video_ch; ch++) {
> +static size_t hws_audio_scratch_bytes(void)
> +{
> +	return ALIGN((size_t)MAX_AUDIO_CAP_SIZE, 64);
> +}
> +
> +static void hws_clear_scratch(struct hws_scratch_dma *scratch)
> +{
> +	scratch->cpu = NULL;
> +	scratch->dma = 0;
> +	scratch->size = 0;
> +	scratch->owned = false;
> +}
> +
> +static void hws_free_channel_scratch_locked(struct hws_pcie_dev *hws,
> +					    unsigned int ch)
> +{
> +	struct hws_scratch_dma *vid;
> +	struct hws_scratch_dma *aud;
> +
> +	if (!hws || ch >= MAX_VID_CHANNELS)
> +		return;
> +
> +	vid = &hws->scratch_vid[ch];
> +	aud = &hws->scratch_aud[ch];
> +
> +	if (ch < hws->cur_max_video_ch) {
> +		hws->video[ch].window_valid = false;
> +		hws->video[ch].last_dma_hi = 0;
> +		hws->video[ch].last_dma_page = 0;
> +		hws->video[ch].last_pci_addr = 0;
> +		hws->video[ch].last_half16 = 0;
> +		hws->video[ch].next_bounce_slot = 0;
> +	}
> +	hws->scratch_users[ch] = 0;
> +
> +	if (aud->cpu && aud->owned)
> +		dma_free_coherent(&hws->pdev->dev, aud->size, aud->cpu,
> +				  aud->dma);
> +	hws_clear_scratch(aud);
> +
> +	if (vid->cpu && vid->owned)
> +		dma_free_coherent(&hws->pdev->dev, vid->size, vid->cpu,
> +				  vid->dma);
> +	hws_clear_scratch(vid);
> +}
> +
> +int hws_alloc_channel_scratch(struct hws_pcie_dev *hws, unsigned int ch)
> +{
> +	size_t aud_off = hws_video_scratch_bytes();
> +	size_t arena_need = aud_off;
> +	bool has_audio;
> +
> +	if (!hws || ch >= max_t(unsigned int, hws->cur_max_video_ch,
> +				hws->cur_max_audio_ch))
> +		return -EINVAL;
> +
> +	has_audio = ch < hws->cur_max_audio_ch;
> +	if (has_audio)
> +		arena_need = ALIGN(aud_off + hws_audio_scratch_bytes(), 64);
> +
> +	/*
> +	 * One coherent per-channel arena backs both fallback video DMA and audio
> +	 * DMA. The video bounce slots live first; the audio capture window starts
> +	 * at aud_off. The whole arena must fit inside a single 512 MiB remap page
> +	 * because video and audio share the channel remap slot.
> +	 */
> +	mutex_lock(&hws->scratch_lock);
> +	if (hws->scratch_vid[ch].cpu) {
> +		hws->scratch_users[ch]++;
> +		mutex_unlock(&hws->scratch_lock);
> +		return 0;
> +	}
> +
> +	{
>  #if defined(CONFIG_HAS_DMA) /* normal on PCIe platforms */
> -		void *cpu = dma_alloc_coherent(&hws->pdev->dev, need,
> -					       &hws->scratch_vid[ch].dma,
> -					       GFP_KERNEL);
> +		dma_addr_t dma = 0;
> +		void *cpu = NULL;
> +		int attempt;
> +
> +		for (attempt = 0; attempt < 8; attempt++) {
> +			cpu = dma_alloc_coherent(&hws->pdev->dev, arena_need,
> +						 &dma, GFP_KERNEL);
> +			if (!cpu)
> +				break;
> +			if (!hws_dma_fits_remap_window(dma, arena_need)) {
> +				dev_dbg(&hws->pdev->dev,
> +					"scratch arena: retry ch=%u dma=%pad size=%zu crosses remap window\n",
> +					ch, &dma, arena_need);
> +				dma_free_coherent(&hws->pdev->dev, arena_need,
> +						  cpu, dma);
> +				cpu = NULL;
> +				continue;
> +			}
> +			break;
> +		}
>  #else
>  		void *cpu = NULL;
> +		dma_addr_t dma = 0;
>  #endif
>  		if (!cpu) {
>  			dev_warn(&hws->pdev->dev,
> -				 "scratch: dma_alloc_coherent failed ch=%d\n", ch);
> -			/* not fatal: free earlier ones and continue without seeding */
> -			while (--ch >= 0) {
> -				if (hws->scratch_vid[ch].cpu)
> -					dma_free_coherent(&hws->pdev->dev,
> -							  hws->scratch_vid[ch].size,
> -							  hws->scratch_vid[ch].cpu,
> -							  hws->scratch_vid[ch].dma);
> -				hws->scratch_vid[ch].cpu = NULL;
> -				hws->scratch_vid[ch].size = 0;
> -			}
> +				 "scratch arena: dma_alloc_coherent failed ch=%u\n",
> +				 ch);
> +			mutex_unlock(&hws->scratch_lock);
>  			return -ENOMEM;
>  		}
> -		hws->scratch_vid[ch].cpu  = cpu;
> -		hws->scratch_vid[ch].size = need;
> +
> +		hws->scratch_vid[ch].dma = dma;
> +		hws->scratch_vid[ch].cpu = cpu;
> +		hws->scratch_vid[ch].size = arena_need;
> +		hws->scratch_vid[ch].owned = true;
> +
> +		if (has_audio) {
> +			hws->scratch_aud[ch].dma = dma + aud_off;
> +			hws->scratch_aud[ch].cpu = (u8 *)cpu + aud_off;
> +			hws->scratch_aud[ch].size = hws_audio_scratch_bytes();
> +			hws->scratch_aud[ch].owned = false;
> +		}
>  	}
> +	hws->scratch_users[ch] = 1;
> +
> +	dev_dbg(&hws->pdev->dev,
> +		"scratch arena: allocated ch=%u size=%zu audio=%d\n",
> +		ch, arena_need, has_audio);
> +	mutex_unlock(&hws->scratch_lock);
>  	return 0;
>  }
>  
> +void hws_release_channel_scratch(struct hws_pcie_dev *hws, unsigned int ch)
> +{
> +	if (!hws || ch >= MAX_VID_CHANNELS)
> +		return;
> +
> +	mutex_lock(&hws->scratch_lock);
> +	if (hws->scratch_users[ch] > 0)
> +		hws->scratch_users[ch]--;
> +	if (!hws->scratch_users[ch])
> +		hws_free_channel_scratch_locked(hws, ch);
> +	mutex_unlock(&hws->scratch_lock);
> +}
> +
>  static void hws_free_seed_buffers(struct hws_pcie_dev *hws)
>  {
>  	int ch;
>  
> -	for (ch = 0; ch < hws->cur_max_video_ch; ch++) {
> -		if (hws->scratch_vid[ch].cpu) {
> -			dma_free_coherent(&hws->pdev->dev,
> -					  hws->scratch_vid[ch].size,
> -					  hws->scratch_vid[ch].cpu,
> -					  hws->scratch_vid[ch].dma);
> -			hws->scratch_vid[ch].cpu = NULL;
> -			hws->scratch_vid[ch].size = 0;
> -		}
> -	}
> +	if (!hws)
> +		return;
> +
> +	/* Teardown-only force-free path; normal streams use release refcounts. */
> +	mutex_lock(&hws->scratch_lock);
> +	for (ch = 0; ch < MAX_VID_CHANNELS; ch++)
> +		hws_free_channel_scratch_locked(hws, ch);
> +	mutex_unlock(&hws->scratch_lock);
>  }
>  
>  static void hws_seed_channel(struct hws_pcie_dev *hws, int ch)
> @@ -326,11 +444,11 @@ static void hws_seed_channel(struct hws_pcie_dev *hws, int ch)
>  		       hws->bar0_base + CVBS_IN_BUF_BASE +
>  		       ch * PCIE_BARADDROFSIZE);
>  
> -	/* Half size: use either the current format's half or half of scratch. */
> +	/* Half size: use either the current format or the video arena. */
>  	{
>  		u32 half = hws->video[ch].pix.half_size ?
>  			hws->video[ch].pix.half_size :
> -			(u32)(hws->scratch_vid[ch].size / 2);
> +			(u32)(MAX_VIDEO_SCALER_SIZE / 2);
>  
>  		writel_relaxed(half / 16,
>  			       hws->bar0_base + CVBS_IN_BUF_BASE2 +
> @@ -400,6 +518,7 @@ static int hws_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
>  	hws->pdev = pdev;
>  	hws->irq = -1;
>  	hws->suspended = false;
> +	mutex_init(&hws->scratch_lock);
>  	pci_set_drvdata(pdev, hws);
>  
>  	/* 1) Enable device + bus mastering (managed) */
> @@ -448,12 +567,7 @@ static int hws_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
>  		}
>  	}
>  
> -	/* 6) Allocate scratch DMA and seed BAR table + channel base/half (legacy SetDMAAddress) */
> -	ret = hws_alloc_seed_buffers(hws);
> -	if (!ret)
> -		hws_seed_all_channels(hws);

After this change, hws_seed_all_channels() is only called from hws_pm_resume, so if
the kernel is compiled with CONFIG_PM then you get a compilation warning, see this CI
report:

https://linux-media.pages.freedesktop.org/-/users/hverkuil/-/jobs/105037046/artifacts/report.htm

But is it meant to be only called from hws_pm_resume()? It looks weird.

So in any case a v4 is needed, but if it is not a mistake that hws_seed_all_channels is
only called from hws_pm_resume(), then perhaps some comments are useful.

Regards,

	Hans

> -
> -	/* 7) Start-run sequence. */
> +	/* 6) Start-run sequence. Scratch DMA is allocated on stream start. */
>  	hws_init_video_sys(hws, false);
>  
>  	/* A) Force legacy INTx; legacy used request_irq(pdev->irq, ..., IRQF_SHARED) */
> diff --git a/drivers/media/pci/hws/hws_reg.h b/drivers/media/pci/hws/hws_reg.h
> index 344cb8d011a9..c8d6715fe0c2 100644
> --- a/drivers/media/pci/hws/hws_reg.h
> +++ b/drivers/media/pci/hws/hws_reg.h
> @@ -33,6 +33,13 @@
>  #define PCI_E_BAR_ADD_MASK 0xE0000000
>  #define PCI_E_BAR_ADD_LOWMASK 0x1FFFFFFF
>  
> +/*
> + * The legacy driver reserved a 10 KiB hardware capture window per audio
> + * channel even though the delivered packet size is smaller. Keep that headroom
> + * for the split-buffer DMA engine.
> + */
> +#define MAX_AUDIO_CAP_SIZE         (10U * 1024U)
> +
>  #define MAX_VID_CHANNELS            4
>  
>  #define MAX_MM_VIDEO_SIZE            SZ_4M
> diff --git a/drivers/media/pci/hws/hws_video.c b/drivers/media/pci/hws/hws_video.c
> index b1af81d1368a..1531d703f6d8 100644
> --- a/drivers/media/pci/hws/hws_video.c
> +++ b/drivers/media/pci/hws/hws_video.c
> @@ -306,6 +306,7 @@ int hws_video_init_channel(struct hws_pcie_dev *pdev, int ch)
>  
>  	vid->queued_count = 0;
>  	vid->window_valid = false;
> +	vid->next_bounce_slot = 0;
>  
>  	/* Default format. */
>  	vid->pix.width = 1920;
> @@ -556,17 +557,18 @@ static void hws_seed_dma_windows(struct hws_pcie_dev *hws)
>  				       hws->bar0_base + CVBS_IN_BUF_BASE +
>  				       ch * PCIE_BARADDROFSIZE);
>  
> -			/* Half-frame length in /16 units.
> -			 * Prefer the current channel's computed half_size if available.
> -			 * Fall back to half of the probe-owned scratch buffer.
> +			/*
> +			 * Half-frame length in /16 units. Prefer the current
> +			 * format and fall back to the video bounce window,
> +			 * not the full per-channel arena that also contains audio.
>  			 */
>  			{
>  				u32 half_bytes = hws->video[ch].pix.half_size ?
> -				    hws->video[ch].pix.half_size :
> -				    (u32)(hws->scratch_vid[ch].size / 2);
> +					hws->video[ch].pix.half_size :
> +					(u32)(MAX_VIDEO_SCALER_SIZE / 2);
> +
>  				writel_relaxed(half_bytes / 16,
> -					       hws->bar0_base +
> -					       CVBS_IN_BUF_BASE2 +
> +					       hws->bar0_base + CVBS_IN_BUF_BASE2 +
>  					       ch * PCIE_BARADDROFSIZE);
>  			}
>  		}
> @@ -1166,6 +1168,7 @@ static int hws_start_streaming(struct vb2_queue *q, unsigned int count)
>  		}
>  		return ret;
>  	}
> +
>  	(void)hws_read_active_state(hws, v->channel_index,
>  				       &v->pix.interlaced);
>  

