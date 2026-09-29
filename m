Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6223CF204
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 14:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790692241; cv=none; b=AIkZ6DObtY5MPtFyAQRZTwMHn8eVDdG1cwcM2N00VhZA6cFugzS6wL+WtUwZOYfE5AkgE7JRZYeIl+oaefdCcBsd6Wa8dve2m3dBsoiH8C1pfeEE5TM6u5bXoU8xota1yPJQGNneMYQuPlAtC7ubYfZI4tzpiGII/FDHJg70F6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790692241; c=relaxed/simple;
	bh=5RH8aoQtRmvy8K9uQVT1zoWnqq8lfmszEHmuirYoqkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J31uE5QmwADTqBBOHEvB2oYFuCm3LazfMVe5V7iklUC5Mjb1ZN312nIojQ3qsXVzEmnkhT1gaW7wDiukih+mXT8Bi2UI9HBLWqLkOP2sqjkMw/lCCpiSH9EEk5/nGjqC4+W/bZkiXDXJ46cdbBkFpWyQsz7o1Vz4FaCjWJjVKTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=USvTALae; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USvTALae"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABCBD1F000FF;
	Tue, 29 Sep 2026 14:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790692238;
	bh=3hJKdQ9F+DtTmkgf++IVGoq1CqPC5cL0d36si2U739w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=USvTALaegRiX/GJ9sAhl4Cm2kFrVJvYi01X7wwHnU5C6TUXGOjtvGPC1HpGwiFJ4d
	 1pyqKQD9me62BZZA7VAisHyNdqAu6EP1JuL6+CazFi/OY7eERWvnQUKVheLAkNKV/F
	 t3edQqiEHs1XgewwJNhQsLTQOysM+vuyQQuBIcNXCRqsDmC/vW5hjHr94csg8JSPUK
	 UbWwytBr1Q3wzfquQoDg/YKpBg/or0IYadmDDOG1o5Lq+PgWxAEVgkZKhx5jxNkZKV
	 pvaPHV1gPQ55Mk3Tp+0JmoVEmAP98bz0o4+/m6fVJPnutk4CLmOHqUYkwfjnzneWdU
	 KaH7Hkkw90j7g==
Message-ID: <34d766fa-b573-4e33-9ded-fac8996be093@kernel.org>
Date: Tue, 29 Sep 2026 16:30:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: uvcvideo: Make uvc_event_control attribute name
 array const
To: =?UTF-8?B?44Kk44Og44OG44Kj44Ok44K6?= <reza1234khan1234@gmail.com>,
 laurent.pinchart@ideasonboard.com
Cc: linux-media@vger.kernel.org
References: <20260805093407.110571-1-reza1234khan1234@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260805093407.110571-1-reza1234khan1234@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5-Aug-26 11:34, イムティヤズ wrote:
> The attrs array in uvc_event_control() is only ever read, never
> modified. Declare it as static const char *const so the pointer array
> itself is also immutable.
> 
> Signed-off-by: イムティヤズ <reza1234khan1234@gmail.com>
> Assisted-by: opencode:auto/best-free

Thank you for your patch.

I have merged this into:

https://gitlab.freedesktop.org/linux-media/users/uvc/-/commits/for-next/

Regards,

Hans



> ---
>  drivers/media/usb/uvc/uvc_status.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> index b632cf5e3fe9..97c939206302 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -165,7 +165,7 @@ static struct uvc_control *uvc_event_find_ctrl(struct uvc_device *dev,
>  static bool uvc_event_control(struct urb *urb,
>  			      const struct uvc_status *status, int len)
>  {
> -	static const char *attrs[] = { "value", "info", "failure", "min", "max" };
> +	static const char *const attrs[] = { "value", "info", "failure", "min", "max" };
>  	struct uvc_device *dev = urb->context;
>  	struct uvc_video_chain *chain;
>  	struct uvc_control *ctrl;

