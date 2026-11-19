Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100966;
	b=Z87L4drHNjAQanQ7oRyRJ+5zRn7HDRwVtjpkCcc2vYmsFjsiZ4zecbRiRskRdfMRGU9R
	 2Nut5qtols9Y6ZuHISVQNW7wdFMpMYIQWgL2/kQM0MmJDsKVNsOmvixRJzh5z1h3kSsRG
	 FxytFNFZKd2ODp7sneYhQCdY7YulLWdZJSX5sjRbAOAdj2hu2TnUiBfdr7TkL1yQU05Cv
	 8kr2+EkQq/f4rG2cFSr9Pi5YUfh8eM5tzUH8eSwnASUUeCa1dCjnTSWDjQdvGcbsdKmhm
	 soYwknKuBosVkUgCDd8J/RUIyPn6uE/7pylTQIgu5WbfW3bliYWW5l8z/XH1cgmpDUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100966;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=PfwD22T5i9K3qchFNkN4IGgIug9HIOAtwO8QBTPBlM4=;
	b=0LnkB7I7UftXcCWxZC3Axafh5QA+ttlUBRYiS6nAGgqIMGAeDmEMQWnrIDH2wNfNhsUg
	 fUx21ho84zxpAhDrhY4a5g7Syfiz75eHWUAjFzImSAP7adiNCVlx8bSEeHJF0QnmBLSHI
	 X9ENnxEEJagFy0U0ltkqK7UzkbY4aNHhMIflIZNeoqDjfIV6sWCU5/ve9t1pxgy9A1bt2
	 0WXfUIi6ov/DtxFKueGvb6qF/E4qSzeCbVdmpEJ/8I6B88pBSzk+EFDE6dG2SummkLNfD
	 yb1c4o4SZaibqBBtwxSj3V8WQAIpVO16ZLUw1hGh9lU4VODbZJ8+eYMGGZtb1tQg3Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=guFLFZ+g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28660606A336;
	Thu, 19 Nov 2026 15:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=guFLFZ+g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BEE01F000CD;
	Thu, 19 Nov 2026 15:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795100965;
	bh=PfwD22T5i9K3qchFNkN4IGgIug9HIOAtwO8QBTPBlM4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=guFLFZ+gYerJ7FOXyljUDTeCUw0eGQRvzyAJav7EsHSjY0+mAacjsZtj6Ff4M87k5
	 +Cxz5ue/WcVDfhE+E0IeyjQS1DhAu8IC2Tdt+bdmUrmbZhU61Bd2Xh/CnLj+cRlTwm
	 HfK6DPNjzhHRHlCxUH7f3k8iAqcLEd9axCaSP/toqeMZdZKiDRVW2H/QgIdVKKD/15
	 oMHQVBqY0idTO5pQFxgI63zIiy/S305vwuRV1AVM+FJ3vEtBy6GwUjE8Zq/MsNPbej
	 t9fwZ4p5xVU3zVql92v2ukq++XzEAxdHVa54LgsmPLDdWZPwWNIEEfTwFe2fJo/rl+
	 4tcCKk/9bFx8Q==
Date: Thu, 19 Nov 2026 16:09:19 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Ettore Chimenti <ek5.chimenti@gmail.com>, Hans Verkuil
 <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari
 Ailus <sakari.ailus@linux.intel.com>, Miguel Vadillo
 <miguel.vadillo@intel.com>, Antti Laakso <antti.laakso@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Bingbu Cao <bingbu.cao@amd.com>, Bryan
 O'Donoghue <bod@kernel.org>, Jimmy Su <jimmy.su@intel.com>, Matthias Fend
 <matthias.fend@emfend.at>, Arec Kao <arec.kao@intel.com>, Rui Miguel Silva
 <rmfrfs@gmail.com>, Daniel Scally <dan.scally@ideasonboard.com>, Kate Hsuan
 <hpa@redhat.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] media: cec: seco: Use named initializers for
 acpi_device_id
Message-ID: <20261119160919.16261a11@foz.lan>
In-Reply-To: <20261029-acpi-media-v1-1-eb50f0a34e36@thegoodpenguin.co.uk>
References: <20261029-acpi-media-v1-0-eb50f0a34e36@thegoodpenguin.co.uk>
	<20261029-acpi-media-v1-1-eb50f0a34e36@thegoodpenguin.co.uk>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Oct 2026 16:54:13 +0000
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk> wrote:

> Use a designated initializer for the acpi_device_id fields which makes the
> code more readable and consistent with how lists are initialized in the
> rest of the kernel code base. Also drop explicitly setting fields to 0
> where it is redundant.
> 
> Unify the list terminator to have a single space between the brackets and
> no trailing comma.
> 
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

LGTM.

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  drivers/media/cec/platform/seco/seco-cec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/cec/platform/seco/seco-cec.c b/drivers/media/cec/platform/seco/seco-cec.c
> index 12db6dca602b..2d7ee5638eba 100644
> --- a/drivers/media/cec/platform/seco/seco-cec.c
> +++ b/drivers/media/cec/platform/seco/seco-cec.c
> @@ -768,8 +768,8 @@ static SIMPLE_DEV_PM_OPS(secocec_pm_ops, secocec_suspend, secocec_resume);
>  
>  #ifdef CONFIG_ACPI
>  static const struct acpi_device_id secocec_acpi_match[] = {
> -	{"CEC00001", 0},
> -	{},
> +	{ .id = "CEC00001" },
> +	{ }
>  };
>  
>  MODULE_DEVICE_TABLE(acpi, secocec_acpi_match);
> 



Thanks,
Mauro
