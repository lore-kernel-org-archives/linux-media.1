Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558498;
	b=Vbr7zLHnGOEmlTWzqG2WWxs2AsWMvmcUubBgvANCcR/wDUaoJ/QbK0OQpB3yo7R1Hcbv
	 oPcon8M30xCALjg/m+81558D/jcWllhpyC350EL0nqX2fAAv7mJzDvMsGV4G6fXwWUUpW
	 GE5XKG/aRlD52kQsei7IF8qQ5AncouY7+lfrVFijR/pLqwxxYkRMQR76cdieZa8Mlkn1G
	 6dGvJ07g7NiStrN+ASecfxtXjDzcv/Dr3J9HOFEfHTd5mNR9sLlqrVnf5ZX47HNXmvxin
	 N8pXoq6m2iB1HCSErRHWl+y5slSXX/4wyv7JM1P0oF9kjUdQf3oEC2kk8KPl4a/9QXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558498;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:From:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=emeR0HMDJ7PN43Qf1dnhb+lV3w2T1zMRCtFRSSk5h7s=;
	b=1HRhjcuKGVJtDRE8+3DuNSINXnFp8ddBvpzY5XRMhohYI4QM7yeambblX0H1IVeiIgYe
	 QIFBzCwLZDw0Ykv+nrZuzCsczK1ThnKSVpFcqvBAxQSOChQQ/QjiHP4LP4yzS9ixO2sVM
	 UKLFg8lOpwlt3ExRRTNEopBzpygO+/jq5YRwX3/r/o7QLS1RACQ6pCPhAOqXlyNvnyIAV
	 3ayHuNgSOW8n2Hg2spo0HJwOVJXul+HbBc64IP1JFp2yd2Mxu1cn5xEGu1PEEQ2agRlcN
	 Q4+7R/PaGT80DrznO2Jnp/zLMJjjBO7rAq3bFUQbxfJZCxd81ayjHl5eHtth0XiBkiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eCC7Ll5o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4992B606B62F
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 08:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eCC7Ll5o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50D7F1F000C4;
	Fri, 13 Nov 2026 08:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794558497;
	bh=emeR0HMDJ7PN43Qf1dnhb+lV3w2T1zMRCtFRSSk5h7s=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=eCC7Ll5o8ONly8tmmDjSM1G7J8F9FXZe/IgHuLsDZqnQaEI5UOqXdo2I0+pQuOKLK
	 fkyzvl0bP5QKN6loWolTCt1GoYLHCloC/n4nIB5XNiG4kJzMrQP9z7U4tl9zo8Zj8v
	 HY0px9o0oMzG8jtN2ZZzbtVl9TYxIS4svwuW2A7BeWyXFse7+8dJv4EP27ya3n7OjT
	 SUEMdjupgUlMUULAXet0o5JYS6TCn9ty31SpIHlF6gUoZh/wLWbsZlAv92LF5uSEDr
	 vYucNREVZlrZ3VVkYfPxHG9uezt482JdREbS3H08ccKVtqsJQ/7e5qNUSZscApilGb
	 ttq0XA3rp8Lsg==
Message-ID: <fc58f61b-b4e6-4b4d-af6b-d29790109eb0@kernel.org>
Date: Fri, 13 Nov 2026 09:28:15 +0100
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
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: gspca: fix stack overrun in build_isoc_ep_tb()
To: pwngets <2605452642@qq.com>, hverkuil@kernel.org
Cc: linux-media@vger.kernel.org
References: <tencent_EAFEF76E0657C04EE304E09B471BF8AA0908@qq.com>
Content-Language: en-US, nl
In-Reply-To: <tencent_EAFEF76E0657C04EE304E09B471BF8AA0908@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/09/2026 13:07, pwngets wrote:
> build_isoc_ep_tb() fills the ep_tb[] table that gspca_init_transfer()
> declares as "struct ep_tb_s ep_tb[MAX_ALT]".  The bandwidth sentinel is
> stored at the top of the loop, i.e. before the "found" test that decides
> whether the pass produced a usable entry:
> 
> 	for (;;) {
> 		ep_tb->bandwidth = 2000 * 2000 * 120;
> 		found = 0;
> 		for (j = 0; j < nbalt; j++) {
> 			...
> 		}
> 		if (!found)
> 			break;
> 		last_bw = ep_tb->bandwidth;
> 		i++;
> 		ep_tb++;
> 	}
> 
> Every pass that does not break raises last_bw, and the candidates are
> the bandwidths of the nbalt altsettings, so at most MAX_ALT passes fill
> an entry.  The pass that ends the loop has already written
> ep_tb[MAX_ALT].bandwidth by then -- one element past the end of the
> array.
> 
> A device that presents MAX_ALT (16) alternate settings carrying
> isochronous IN endpoints with pairwise distinct, increasing bandwidths
> reaches that pass with nbalt == MAX_ALT.  On x86-64 the store is 4
> bytes at ep_tb + 132, which is the upper half of the stack canary, so
> kernels built with CONFIG_STACKPROTECTOR_STRONG (the default on the
> major distributions) panic in __stack_chk_fail() when
> gspca_init_transfer() returns.
> 
> Only the device descriptors are needed: the store happens while
> VIDIOC_STREAMON is being handled, before any isochronous transfer takes
> place.
> 
> Give the table room for the terminating entry as well.
> 
> Assisted-by: Claude Code

No Signed-off-by and incomprehensible AI prose.

Rejected.

Regards,

	Hans

> ---
>  drivers/media/usb/gspca/gspca.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspca.c
> index 594d73e..64bb818 100644
> --- a/drivers/media/usb/gspca/gspca.c
> +++ b/drivers/media/usb/gspca/gspca.c
> @@ -753,7 +753,7 @@ static int gspca_init_transfer(struct gspca_dev *gspca_dev)
>  	struct usb_interface *intf;
>  	struct usb_host_endpoint *ep;
>  	struct urb *urb;
> -	struct ep_tb_s ep_tb[MAX_ALT];
> +	struct ep_tb_s ep_tb[MAX_ALT + 1];
>  	int n, ret, xfer, alt, alt_idx;
>  
>  	/* reset the streaming variables */

