Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7A9357739
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 19:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780081347; cv=none; b=FyKVJj+zhUw8p/UxZMMmaZHbLuT0yjaVozdLtbqv9aXu69DA6+yzIrmFgQ9KSdDuSB9mgkmJRiWO+kYIZDgrP/8wv4zMGfzC53XVJg0V8MD8VchC9dOHxybc6P+i6PvkHIzBRZ7QpOFVqeApHFJrkr0W2vHaBBDeNr+h+Jwn8QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780081347; c=relaxed/simple;
	bh=zU7nBanv7wQ6xgPni/m9h2Rb/mCqWexou8yXUnJszxs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rWFlVRkX7z2fha4BWwJqSwJTj2wc6p9WU3Xj+8SuwQ3y+W1vQTABygdpoUo/yIVe6cX3U/f/+1Z/8IIKHmrGjRed60jSMQzWV7iJc/oZfRJyxrzsqp5KpOUDCQz05t2YYCl5BwGGRK+a3btb74AaQo8ORGrtz2cdb51YHqUQUkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJ86eOkx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJ86eOkx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D8D1F00893;
	Fri, 29 May 2026 19:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780081346;
	bh=ErVzC+K16utkoyh54605iT7Iet95iSB7w1y0dWvz2AM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iJ86eOkx546WEtnOMIRwQ6sgeOppv4PQ54+EfhKsNC+00aM9Pux8Y1tz5PyEFLYr2
	 AbAHnQo5W0a4djS9TwT9LM1ez/EoJis0w1ckUenSRl5PzsZb+MLGZxQmyCWXf+BS41
	 zRdIF954Pr6A+fEeUygVNncPh4Jk+gg69onj6dlmNiUFAtJwrgaB2CL2b25PyFnmpI
	 qUhdsgDOub3ZXOClBHt7SdahygiV1SSR0j7GV02sKCQv7HErAO+7O/7rP6MPF6yyVw
	 CXul7WKJhaojQQbEJEiUt7TEE1rqylj8pjLZXehDUl2/MK8GsQC39vD0FnI7VhNr1a
	 3452fewqQ3umA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 (repost * 2)] media: usb: siano: don't set
 URB_FREE_BUFFER flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tetsuo Handa" <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: linux-media@vger.kernel.org
In-Reply-To: <bf19e526-3327-46a5-8ecd-4baaadef5bcf@I-love.SAKURA.ne.jp>
References: <bf19e526-3327-46a5-8ecd-4baaadef5bcf@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 19:02:25 +0000
Message-Id: <20260529190225.F2D8D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A race condition during device teardown (`smsusb_stop_streaming`) =
allows an URB to be resubmitted after it was killed, resulting in a Use-Aft=
er-Free and out-of-bounds DMA write when the orphaned URB completes.
--

commit 7f00858c7ab2fb0e69617ed008b46f7ad16b84b7
Author: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: media: usb: siano: don't set URB_FREE_BUFFER flag

This commit removes the URB_FREE_BUFFER flag in smsusb_submit_urb() to
prevent invalid or double-free issues. The URB transfer buffers are
allocated upon device registration rather than being dynamically allocated
per URB.

> diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/s=
msusb.c
> --- a/drivers/media/usb/siano/smsusb.c
> +++ b/drivers/media/usb/siano/smsusb.c
> @@ -168,7 +168,6 @@ static int smsusb_submit_urb(struct smsusb_device_t *=
dev,
>  		smsusb_onresponse,
>  		surb
>  	);
> -	surb->urb->transfer_flags |=3D URB_FREE_BUFFER;
> =20
>  	return usb_submit_urb(surb->urb, GFP_ATOMIC);

[Severity: High]
This is a pre-existing issue, but is there a race condition during device
teardown that allows an URB to be resubmitted after it was killed?

In smsusb_stop_streaming(), usb_kill_urb() unlinks the active URB, invoking
the completion handler smsusb_onresponse() with urb->status =3D=3D -ENOENT.
However, smsusb_onresponse() does not check for a disconnect state and
erroneously schedules a workqueue item (do_submit_urb) to resubmit the URB:

drivers/media/usb/siano/smsusb.c:smsusb_onresponse() {
        if (urb->status =3D=3D -ESHUTDOWN) {
                pr_err(...);
                return;
        }
        ...
exit_and_resubmit:
        INIT_WORK(&surb->wq, do_submit_urb);
        schedule_work(&surb->wq);
}

When usb_kill_urb() finishes and returns, the URB's internal reject flag
is cleared. If the scheduled worker thread runs before the subsequent
cancel_work_sync() is called in smsusb_stop_streaming(), it will
successfully call usb_submit_urb() here in smsusb_submit_urb() without
verifying if the device is being torn down.

Because the worker has already finished executing, cancel_work_sync()
would then return immediately. As the teardown process continues, the dev
structure and DMA buffer are freed. Does this allow the active USB
controller to asynchronously write data into the freed buffer memory,
causing a use-after-free when smsusb_onresponse() dereferences the freed
dev context upon completion?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/bf19e526-3327-46a5-=
8ecd-4baaadef5bcf@I-love.SAKURA.ne.jp?part=3D1
