Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282548;
	b=eR4vJ3m3R4NyhC42ZZODOWNtjyElISutl6rownilu1ejhEB/GxnukPe+/AdUfpyasB4F
	 1wwH3nK06rQ4PlGM3iebGw7DiObdQ72PVzSjKhY347gggAnVHRsGg08u26onWAldFs6oZ
	 Dce7bunXHX4wFNKvBEYU4FHWUByi7Ubu23NthEZ/QCn3rjdCzu7yla/azRmWC1CbnF41W
	 xudeRntUvuBaBtMU4OSLgLxSQXWjEXC+MHAOivp1qlfa0w7G9oMvpfquopGBt88BV6X3E
	 qahhIie2ydcb4oEGGcfK9bIX/dCo7g1VkMIdJcC0a8WoAKeGt3JrKmR1uWeUIBmpKOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=0RQgg9XkQQjNtxOZRFyZActChBDX4Rkx4IIWd03eO+o=;
	b=ixfRk8s2F41Vtmg3XS2arnoHW9GBISK0+lxmyeCwfMk9M4J7jfGfNuNYlAdl175bOlcq
	 Y4+62xvCaQYpe3ivzN6yeJPA7Ft4Mlvc3cKKOLTlCnaVy5zRQeKPOmnEnifmeXM48T8RO
	 RWgvHm0HKu9wsNmPkotzbT9B6eoLxAGNDGMs5vm+jHRlBk/lLOkwJzIILIInDLwh4iauJ
	 DQ7qMKbzwHzWXt/FB0EFN6D4HN53cfMXopgSr6GS47C1b/hV+nkVtOaabkx/RPvWCxcCH
	 T59Qo9Js0FI8a3duDB7nDASELLxuBvsIxEsVJe/tbudlhHKbyP1/l3pvyNTO0Rgcz+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sBcjZp6B;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E60606A321
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 14:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72E60606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sBcjZp6B
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c49c32650adso249055766b.0
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 07:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793282546; x=1793887346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0RQgg9XkQQjNtxOZRFyZActChBDX4Rkx4IIWd03eO+o=;
        b=sBcjZp6BHuS2Mqniaxa/BhZVVnB/63U2jR35l97q4rKbQ+CW0qM1uw3OOFEyGfo/Eu
         hxE0h2diZb2jBMFgdBqs69qLfEmYz6HoKbyt1uCDSinEQaAj5oWG6NTSz00tl7+O+o0R
         PVL5n2uQ1iCb2hwvSCmZvpvVkhpm5K0zxc5lQXhbbf6YGBGCiKr9k9p8ixmkVOjwbT24
         KQHgQ669rsQsScvqCQHnrmGBd44jx5ZlfKc8KLTYEYVC6yX6BZba8rtjgBM38epYIw/E
         znjOmqjB4HqhT7bDFGGblDr6PBAXOdN59+0cRuiAKo697MSzNTS5HwbH4uYef9gu8MDJ
         bUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282546; x=1793887346;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0RQgg9XkQQjNtxOZRFyZActChBDX4Rkx4IIWd03eO+o=;
        b=FQNT7a2B2ZicvhdDZssFutRda2eI+DbHyIr/jW7j2vhVqi0T2wBRV+s21oCxea+Zex
         oXmKEU44hPcZOTYS934kkLFmH4U/W+TThsgJeEfXHXd46c5hIVa4t4p64Fg7U0Yksz6X
         XTV4pIrU1OzhgQv7f7M7PHXoDiQ5lOHo3ds5Qnn/cMBsZJ7lcRWi8IdX0Jedr9G8dJAj
         5xKvk7jpm4jHW8k9Wvppdpys/0eBB7W+d4PvYFXk3rn3s09P8X/zgwHgS1KHZ1VpSqcy
         OTfhxvxTdcTDpjXEwk39wPb5adwcMTm9Peicca4TpTW9dsJNmHWSbWw6JQgojKTvtos+
         d0eA==
X-Forwarded-Encrypted: i=1; AKwUvBzejITJptnOUTek9Zu8er4Hfh6o0/gXTZ2jDjE4SME/lkaJFPMXrchZlxDurCFexV/8f7VaEXcHlpGrkg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKXCNL6x0Vk+G99xa7LE+9pEyCZ9/8bPvWW0Q70rwq1x1zjZHYN
	8HbU5fhAnJgO6HH64gkUtnYvPCIeskj5GuVhfdrT0QJYHyNgtxNucvsjIUJlDIZn5oU=
X-Gm-Gg: AYBFou1IciEh8oa6AR1Ds+volFQmfeTDR/JI5VeQ3LA5CFUP8WthNQ3PHVMPtZcXeJf
	wxWm5Gag/Sefyoum2fnPLZwnBZf69kLIUuTjeLk4ms9RMarjwaHuIv3pW77R68ttTcxUj83WSeJ
	Qg6jQ+kwQiktt7B65ItCbgVkT/pzu8ZF5oAT7FXmWIXeFUvfk8dYMEDFrhfLznULhSCWPoghIsy
	Jcbz+yc4sNxO+TDKaYH6Mg6Dhrsnqce6xfgnycMSJHgq64PzAMeOoDFvGbXRDyIBD9KVYv7FXGk
	gCHsWW5NNQn0HuBRuhUhcXHQOf/ZZgiDrNJFSM4Y+1hFT4NStqhl9ZvhUBpY46+y8H/51ruqMSG
	9TnWvr7vV3kNn7JBrFel/a9DISjGuBibWqVgBr4jBYQekQ2Uf1z/ir+jGZEnArCIMKF/P4VnX+s
	D8wAjfEp1imYmdDm1cgJcTuNTqwDmChtFB5NDCN4rCS5nmoSjXSTCT91TLNQ98YBz1glU/OTBa1
	otbf6EMMvRJXQLQqGZ6Atuhmk/qiEQywx/hFVr8Ni6WNfxetaxZjOGPBVTkhh0A7cPTW6wowq4/
	QHKGo1FJCzvwwWQjkq/S9jhKgMYzANZdUxGYNZwA9DE8GT8mMEHSRj0T6LnvxQ==
X-Received: by 2002:a17:906:68db:b0:c49:df71:14f5 with SMTP id a640c23a62f3a-c49df7118bcmr106503866b.31.1793282545315;
        Thu, 29 Oct 2026 07:02:25 -0700 (PDT)
Received: from [192.168.0.167] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e784esm720921666b.19.2026.10.29.07.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 07:02:23 -0700 (PDT)
Message-ID: <4d7de0cb-4a88-4af2-a407-a53d060d04a8@linaro.org>
Date: Thu, 29 Oct 2026 14:02:21 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: camss: video: check that a buffer is DMA
 contiguous and add a prepare hook
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261029123107.28705-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261029123107.28705-3-xiaqinghuan@mail.ustc.edu.cn>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261029123107.28705-3-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/10/2026 12:31, Qianhui Xu wrote:
> The write master of the newer VFE generations can only be programmed with
> a buffer whose payload is physically contiguous

The first problem is that is _not_ what your code checks - you should 
use sg_phys() for that - which gets the physical address of a CPU 
scatterlist entry.

What your code currently does is check that the IOVA addresses are 
contiguous.

But what happens is an IOVA allocation is made which is linearly 
contiguous in the IOVA address space and then SMMU entries map the IOVA 
back to physical entries.

So all we need to do is give the IOVA base to CAMSS and it can write 
IOVA buffers - its the SMMU's job to ensure the resulting upstream 
writes land at the right physical address.

> increment registers describe one linear address range.  Check that the DMA
> mapping of every plane is contiguous for at least sizeimage bytes and
> reject the buffer otherwise, instead of silently writing past the end of
> the first scatterlist entry.

> Also let the SoC code add its own alignment requirements to a queued
> buffer through a new prepare_buffer() video operation, which runs after
> the generic checks.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

And I can prove it too.

buildroot# uname -a
Linux buildroot 7.3.0-rc1+ #19 SMP PREEMPT Thu Oct 29 13:26:34 GMT 2026 
aarch64 GNU/Linux
buildroot# dmesg | grep -i crd
[    0.000000] Machine model: Qualcomm Technologies, Inc. X1E80100 CRD
buildroot# dmesg | grep "plane 0"
qcom-camss acb7000.isp: plane 0 chunk 0: phys 0x000000089a800000 len 8388608
qcom-camss acb7000.isp: plane 0 chunk 1: phys 0x000000089a600000 len 2097152
qcom-camss acb7000.isp: plane 0 chunk 2: phys 0x0000000899900000 len 1048576
qcom-camss acb7000.isp: plane 0 chunk 3: phys 0x0000000899b00000 len 131072
qcom-camss acb7000.isp: plane 0: 11677696 bytes, 6 cpu entries, 5 
physical breaks, largest physical run 8388608, 1 dma segments, 0 iova 
breaks, iova 0x00000000ff000000

Plane 0 == 11677696 bytes
Largest physical run = 8388608

Interestingly we see some physically adjacent allocations here and then 
also non-contiguous allocations, which is the negation of the thesis, 
constraining IOVA to physically contiguous maps is provably incorrect.

NAK

diff --git a/drivers/media/platform/qcom/camss/camss-video.c 
b/drivers/media/platform/qcom/camss/camss-video.c
index 0852eb6f13..d2df368d5f 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -146,6 +146,44 @@ static int video_queue_setup(struct vb2_queue *q,
  	return 0;
  }

+/* DEBUG: how a plane is laid out in physical and IOVA space */
+static void video_buf_dump_sg(struct camss_video *video, unsigned int 
plane,
+			      struct sg_table *sgt)
+{
+	dma_addr_t iova = sg_dma_address(sgt->sgl);
+	unsigned int j, pbreaks = 0, dbreaks = 0;
+	size_t total = 0, run = 0, maxrun = 0;
+	struct scatterlist *sg;
+	phys_addr_t pend = 0;
+	dma_addr_t dend = 0;
+
+	for_each_sgtable_sg(sgt, sg, j) {
+		if (j && sg_phys(sg) != pend) {
+			pbreaks++;
+			run = 0;
+		}
+		if (j < 4)
+			dev_info(video->camss->dev, "plane %u chunk %u: phys %pa len %u\n",
+				 plane, j, &(phys_addr_t){ sg_phys(sg) }, sg->length);
+		run += sg->length;
+		if (run > maxrun)
+			maxrun = run;
+		total += sg->length;
+		pend = sg_phys(sg) + sg->length;
+	}
+
+	for_each_sgtable_dma_sg(sgt, sg, j) {
+		if (j && sg_dma_address(sg) != dend)
+			dbreaks++;
+		dend = sg_dma_address(sg) + sg_dma_len(sg);
+	}
+
+	dev_info(video->camss->dev,
+		 "plane %u: %zu bytes, %u cpu entries, %u physical breaks, largest 
physical run %zu, %u dma segments, %u iova breaks, iova %pad\n",
+		 plane, total, sgt->orig_nents, pbreaks, maxrun, sgt->nents,
+		 dbreaks, &iova);
+}
+
  static int video_buf_init(struct vb2_buffer *vb)
  {
  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
@@ -163,6 +201,7 @@ static int video_buf_init(struct vb2_buffer *vb)
  			return -EFAULT;

  		buffer->addr[i] = sg_dma_address(sgt->sgl);
+		video_buf_dump_sg(video, i, sgt);
  	}

  	if (format->pixelformat == V4L2_PIX_FMT_NV12 ||
