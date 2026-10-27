Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109310;
	b=nkBaXSHMGd2qWldyLHDXx1i5csFoK1bus5bXo1nmCLLqQRxe5wDXm2sCVusXQ/lKUvPJ
	 VL9BXTm/7H6m8sYK789AXLx0O8uAHCUXtjBkPf/Q96flCqHvpjiXdkbIoBMB5CdcQoYBS
	 BXPpHD7Kq6Nzd2JtYW9drsIy+ddN/NEebUarnAGAYGz9CuI1AX7Zwva3Zx7a+oG+iL3XB
	 2+r+eSS3LzwpNWHRPLLv58sWxSrn+Xb/RAhXeqElh9jp15KyanLcdaWsBB1pzE6teERIi
	 TAyEJM2hqgahUKIHenhnr+Y+PrCKFYevU+tz7v8HJuzAUdCQAk9ZZcN4mtxJQfoOMaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=GVkvb7RyNltb2aNxqylXfnad8kaMLOY9LcxHWp3fmdQ=;
	b=BgCK6YY9bnGT8tWaStJLsbiz7g1hxJK/JsLH5MlSmgL3mDYI7bBCeyNjIkESFJUaqgvI
	 IJGu27SUt8sTTLko8ubcThEzkoVr+W/EdkS/GVzOOE1Sed5DnrOKsW7Gx5GHKEm5z2c9o
	 yfJYMQZMKbHr1vwiElyXt3wQ2jLOeLJDqQOLTyiXg/zh7eafsCfAnKuf5EWTnsr6l+55D
	 VCg47AMjw6UVvO6+pOv95AJhjT1pJZVJXBUAik3JJS8p29LJZLk53MPuFnBr952IPmnnc
	 3kwGi1cMSeLTXXd0NFuidBhKlbBj7lGQL0gaTKy/1l7oOzizH42PiBXp/fMEn0kpKyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UuW6jW7i;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95417606A326
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 13:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95417606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UuW6jW7i
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso1692300a12.0
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 06:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793109308; x=1793714108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GVkvb7RyNltb2aNxqylXfnad8kaMLOY9LcxHWp3fmdQ=;
        b=UuW6jW7iVqbFqu22iOXCQSLtTllYEgotxHU7UyRSfjx+7NxQW4a003XnHfqUqlfSwp
         PW5t3QcGz9Q5jEv10yNg/qTofJLqo80Y69DueWYvGN2xoWMZgwxQ7PBkQmUJCmXd8dII
         Z4bLEsKwdBj4nLF2BfSX1E+5X6qyb2FZYd78HiqHNCQdDijdO020WIE81bgqXfWPoJ5U
         Q3oxhj8O1hr3QBfnRE/FZf3Khp7fggxQSqctuRwaRQDn4y3Vatk7P8ONrujZ+skuHVgA
         IV8Vz5DryvpCfJax3XXfYMJXzLUa4P32GvkfEGBTPAkMPXxCbCtD4aO6S1hV7D9n2lfh
         W3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109308; x=1793714108;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVkvb7RyNltb2aNxqylXfnad8kaMLOY9LcxHWp3fmdQ=;
        b=bgYickjXlCmENu3Lool0V2pZqWaj/IjkvrBcPIK6ocu+z17ZdAldAWiy2n71T/LdA3
         SnV5+34iGHqv3Yz+j4QbF2CmaCygC57dxyPMAhtOvCXu12jzrp+WRTvZE8yU/qjz1htC
         CdB4vwPt4nIbgbLZtnRI4bDQV9yM8ELMxrMwZqft8xXn5hjO47+PQb5VeAEdNNGOPHWh
         QBuXPMOe15f68AJ7ZqqR294qkv6uXf/iSp3X3TkqRkv5xcCstLuD7AQE+dFPUt3HoZXs
         rQ8ctd4N/L8LfpDjKyqRpHwre+0174BKXnZPBjA3LOlbKqwDxHuJQ/lkPDH1XjLn2tGl
         bGVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwy29hdkMP/KePiVYvsFTsUeDjGLMAhJyI44GK/hkDGL6lEYsyhOKTfZgULFWcBtKSgZ7GVq8BblenIJQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLkWAmT2gTxbjqsFENCpGvLK7/rgeR1JRW7R7EFNvEP5e/byfNC
	1thyIvjTbORm23fkYc9857+fUc4p9qgt/Z5QbmA/TJkRRJZhzfSHGzOE0Kg6tg==
X-Gm-Gg: AYBFou0hW55gzNNn/JbKLyBIgH4QlrOY/nDEe98i/3awaiagGqulpBf7uKdUPG7nIjE
	/S45G3QZLoYbKpkYROC0GZE6G5KC0npC3JxwBtCji7eSO9NRPMlQf/wq4mynyyeB10Hyxix2eU4
	MRx128xRdiUYPg2jC45OQLvXeo7my3oWcC9rpl1Eri0DSsvFq/72d3JbwKr9yWcU+3FFQEk3XyY
	OzkFcJ6nZ8eAWB3vvkFEVlyHt5AKgqGX9cg4PXOUPdpN9qIGA8IgBoeQesM4YlVHQqlq1elKswG
	9vZsgplNpfZCbfThn6vTepQs28An2EoeGlri/jOA+erFZFV+3/TlIwBpWAphLbk52PY7uNqQocz
	CPqiSfujGVuYefbBjDAjimfpZXh4aPIB+sFbu6Uy+ooI6yNhFDJqGS3FkYPr8XK6cwBPSQc3vdR
	aJyYOhOW/YUiQTC+FkCf2lttxFejJoPy0Om+6cA+q8Uzy0KvUPVRpGWJQ0wLeqpr2OHVsQqKl8v
	D92SNZvDLD3xQLfgSUYxrvpqmXiPdZCYt5iGHV1ha9kNYyqreObgDzVCnnZEHVCyRuyjxO5jZHd
	PVePGZCe1OcGUWJ0zqtwFzq5lkSlLVs8rPRO500EBC6MKBjpoTJxJZY4ALIebLa/dCocDJzTsR2
	Yf5RLv7BKtWqqDfS53pmBEAuWHqpU
X-Received: by 2002:a05:6402:c4d6:10b0:6b4:8b1e:2866 with SMTP id 4fb4d7f45d1cf-6b48b1e2b36mr688570a12.16.1793109307845;
        Tue, 27 Oct 2026 06:55:07 -0700 (PDT)
Received: from [10.54.182.141] (82-132-213-26.dab.02.net. [82.132.213.26])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49640c339sm63568a12.17.2026.10.27.06.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 06:55:06 -0700 (PDT)
Message-ID: <749e9437-85a6-45fa-b984-b155a1eeddaf@gmail.com>
Date: Tue, 27 Oct 2026 13:54:57 +0000
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
Subject: Re: [RFC PATCH v2 0/1] misc: fgds: introduce GPU-File direct I/O via
 dma-buf
To: Li Wang <liwang@kylinos.cn>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260908131545.105987-1-liwang@kylinos.cn>
 <20261027090853.30099-1-liwang@kylinos.cn>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261027090853.30099-1-liwang@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey Li,

On 10/27/26 09:08, Li Wang wrote:
> This patch introduces a driver named fgds that allows moving data between
> a GPU dma-buf and a regular file on NVME without staging it through the
> page cache. This is particularly useful for LLM workloads, such as model
> loading, KV cache offloading, and checkpointing. The fgds device
> corresponds one-to-one with the PCIe GPU on the machine. The usage is
> straightforward: an application first calls ioctl on the corresponding
> fgds device with REGISTER_BUF, passing the target GPU memory buffer
> address (represented as a dma-buf fd). Subsequently, the application can
> perform direct data transfer between a regular file on NVMe and GPU memory
> by invoking ioctl on the fgds device with READ/WRITE, passing the file
> descriptor and the handle returned by REGISTER_BUF.
> 
> This solution allows both applications and the fgds device to work
> seamlessly with GPUs from different vendors without any modifications.
> Furthermore, applications no longer need to call vendor-specific
> proprietary APIs (such as NVIDIA's cuFile API) or install vendor-specific
> kernel modules (such as NVIDIA's nvidia-fs.ko) for different GPU vendors.
> We have tested fgds on NVDIA and AMD GPU cards, and theoretically, it also
> works on GPUs from other vendors that support exporting GPU memory via
> dma-buf. Some performance test results can be found in [1].
> 
> This implementation offers several advantages:
> - Simplicity and Efficiency: It provides a lightweight and intuitive
>    interface. The single ioctl call mimics the parameter structure of
>    pread/pwrite, and its return value semantics are fully compatible with
>    pread/pwrite
> - Isolation and Security: The interface is independent and has a minimal
>    impact scope. This isolation facilitates fine-grained permission control
>    on the device node, enhancing security management
> 
> Changes since v1:
> - Refactor implementation per Christian's feedback, on top of Pavel's
>    DMA-buf support for io_uring [2]

People already replied, but I'm going to elaborate a bit. That series
[2] already exposes a uapi via io_uring, it's device agnostic and all
that. The framework was made to allow multiple users, perhaps folks
have some kernel-internal users in mind, but a completely new
read/write uAPI looks unnecessary, especially an ioctl() based one.
It sounds like [1] is already using io_uring, so it doesn't sound
like a problem that the entire uapi is io_uring based(?).

> - Add validation checks in the XFS I/O submission path to ensure that
>    bios with the REQ_DMABUF flag are only processed via direct I/O, and
>    prevents the kernel from attempting to fall back to buffered I/O, which
>    is incompatible with DMA-buf backed GPU memory regions. While currently
>    supports only XFS, the underlying mechanism is filesystem-agnostic and
>    can be adapted for other filesystems with similar minor changes

xfs support it a it orthogonal to the uapi question, but it should be
implemented in xfs and not side stepped. There is an RFC on the mailing
list from Anuj and Nitesh that is trying to do that.

> - Address the comments from Greg and the Sashiko AI
> 
> [1] https://github.com/Storage-and-OS-for-AI/fgds
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git/
>      tag/?h=for-7.4/io_uring-dmabuf-20261023
> 
> Mengmeng Zhao (1):
>    misc: fgds: introduce GPU-File direct I/O via dma-buf
> 
>   .../userspace-api/ioctl/ioctl-number.rst      |   2 +
>   drivers/dma-buf/dma-buf-io.c                  |   3 +
>   drivers/misc/Kconfig                          |  16 +
>   drivers/misc/Makefile                         |   1 +
>   drivers/misc/fgds.c                           | 506 ++++++++++++++++++
>   fs/iomap/buffered-io.c                        |  11 +
>   fs/iomap/direct-io.c                          |  23 +-
>   fs/xfs/xfs_file.c                             |   4 +
>   include/linux/iov_iter.h                      |   4 +
>   include/uapi/linux/fgds.h                     | 124 +++++
>   lib/iov_iter.c                                |   1 +
>   mm/filemap.c                                  |  22 +-
>   12 files changed, 713 insertions(+), 4 deletions(-)
>   create mode 100644 drivers/misc/fgds.c
>   create mode 100644 include/uapi/linux/fgds.h
> 

-- 
Pavel Begunkov

