Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792447002;
	b=whBRL2TeGzLv4e1zgDSqXY8uyNVyGiuu+yMnnwXk+miTcciJwZz86NdBbFoZjiOEQ2jw
	 UFhOUlu4EQBGl795Ztuc17SwXQ/t6yo+sy6BjcmujymnrLmkZJOuK4xkv0a0dCZl8i2DM
	 tBwJE4RA/yUOjXRNJW73XPBCG0pVOnFXCl8r5QnVKpb1DvDktakvYCZxQ6o7fW8VsGO6M
	 HUrBGDvIBKXhP23Nc8s4QvfqPsm37mnKBVLqsi2wd1tBK+9P6PgiaYCsUhxVJgXd9Xl5h
	 r9hn3Ajk3AqEhQRn5krBg6/6H1Ui28qw2NLxrB8H+jeVHXsbiRgkF9U8D4py9+wjJoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:MIME-Version:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=hfQ+jS733ACKP96HHpjKWBqcD0MjsSHnKcHO4UU8xAY=;
	b=KuEsdI19Abj1UvIDIxJa9PN+OzkimzaLl67FiR/l5a/98ZtuR6kB1sLPHDCcwyqZU9Tm
	 mI8Ipn6wEQxtrkXz40zDlo2PFzet9M8v3ovM+qE3pBbYsEbRIBWHGQOxpxptEtEBkeAp4
	 9B3RP/LkFa+ognJ/FpqjkiuuDw8lJgjlBB9UALIwJy8ONIOtuf90gzlg7cqS3iQ7bxZ+k
	 Md2LMAUJGDo+gpOaalJCcwWIyKxf1dpg79+mVN6sN5gsvJO/qOwTBgcxDLiQeW2yYZjlr
	 2SI5ScNtJv9mXUG6KshBVNJ+tOYW9Ep+/0hTh8FGAGaTSsMGU5b50TdmFlKsvZ3UmEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=carboniste.com;
	spf=pass smtp.mailfrom=carboniste.com;
	dkim=pass header.d=carboniste.com header.i=@carboniste.com header.a=rsa-sha256 header.s=google header.b=Cund1o5Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F965606A32E
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 21:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F965606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=carboniste.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=carboniste.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=carboniste.com header.i=@carboniste.com header.a=rsa-sha256 header.s=google header.b=Cund1o5Z
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b0e1b91607so2779137b3.0
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 14:56:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792447001; cv=none;
        d=google.com; s=arc-20260327;
        b=fVnbj6Xqf/51cYuGxPjsreOlwZtjB7DOrZPbVcv98Krbkmzrkh/EkJHV4QPepMqnAC
         mMcbc5NIZXEpOCuAK8DAJOJQmNrTiY1SOU43M3uJhgkKkXlU4dIAploSi84dJg1gZWp8
         j98b61ZdFabKMMtQ5TmWZzWRhA/4bjNqhE3qqy4Vbf3+sKc1LGxRGYCl7QbZ+le16mtX
         ahXFxgLQIEca44fIOr9GtsYmPaChysynpgrDJkBK78wRZzMye6MB/z3kioHmOzS+VxGq
         buSz8LJKFggTk8hgpEwgAOQN/B3S6htHMvNZF1eUzsvUR90SPaADmnJJi6ESSl2P6XrJ
         6fig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=hfQ+jS733ACKP96HHpjKWBqcD0MjsSHnKcHO4UU8xAY=;
        fh=Rqypk6/B2bm47j3naeIq2KBn961Dpl71M2GUZZH0YIk=;
        b=OTCN8oXO4yqzP3Elbat9Fl7uYu4Xack8gYrZRsmc7toaO1xO96hP4JibWd6pftQ8fr
         rnGGaKY83XYG1Uwzhf7alY5xqbj5x2EzJEB+n0tJBxUeIm4q7FepjpsotxW5lMpmdTbe
         kO9WMy+bf4369pZlp815A0xcBH9Zj5eOF+daU/8pKRoLiGdf59a8KRrZW6SUMaOeO4Mw
         BhIxHHDxlSHdubN2zK3+2Sby/30Oi6HD3obO95TxV3F9MV4tQcYrZT6k46WPYPX1PZeH
         yIrux9ZsfM04iOwwUXm9IQkYo1iapMrijYKpF5QI1bwXgKSgg8TtlxCjQVijePWHPKp3
         hugw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=carboniste.com; s=google; t=1792447001; x=1793051801; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hfQ+jS733ACKP96HHpjKWBqcD0MjsSHnKcHO4UU8xAY=;
        b=Cund1o5ZqCZBKom/OktIo42Wr7rJNM+69jXu6ROfSUglSGtopu+b7PhzbsuM2BofG/
         GOVopqtuhL0iseAibNRab+LlQLi7PL0rWjKpW5+g7Gr9LAFm13+J9tbAEZNqR32JHxch
         e/Kw8Zr/pGZHiHhqTapqYidfh7jYizpcurvZMD1odceRUByVtCKHaV+WLu7jMHu5qQUJ
         4Q6+1PMOWdo1rv2X3z8V0Y8GVztQZPw7D8WNKTgPB6AsxBP14ikugxcm5UYJjaIS4gdy
         dtCBEHwlYagUqoSt2Xxi5Oas5nUr6QUC1Ge7+WkjGz7j+SRfi4EtpfDONRLSsH+zgprZ
         H80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792447001; x=1793051801;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hfQ+jS733ACKP96HHpjKWBqcD0MjsSHnKcHO4UU8xAY=;
        b=yVpmz31mzlORcxIG65VLyxY0RAhM+/m9eTJGu16/m65/EnuNspX/AVD3jxjabd+VBT
         +qfHHhWlhD8J1qpf9IC6a99KUDz429tzhl4yR58O9lp3Tp3tHd7qiEsNB6VEN4ojMyuu
         g+pabXXbWX2jcqh3LyGJW8xFbc3BZesVvCT0CsHqZ6DCY3eiMJD+PGL0oC3YtViJZNZ8
         WW4AQxujQz++ELs4S1M3VhTiroIfo+vVEck5C+I+UGU3AMFuktFgbxQ3nSsed9Fd484q
         EWAPgOnW8fg9WiMaJoL5OSiK5E7RU3R0pjxvFDgd2zAf/NzILdfQMbwIpKegHOVCSh+/
         CxIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwW4yo4+EyrO1E+3aC7B8U6e4WQ9SXmTpFWOk2YgvWdAzJ4bddM5TFlDfbcK2pHbROTd8Kxrlm9Mgmf4w==@vger.kernel.org
X-Gm-Message-State: AFq9FYIUm0fmNxl9Xvd3LIyZwG9yCYpjLwT7AyMLALXOrvW/8EKfRLGh
	ULkZd62DEiYwUBgNdKbI5+DuvNko4W+xLftrHQLwN3sKgxz2YL+PxHiI7hv/rUXC5O/Y7UOWPgv
	9ejMJr3r51eDZj+4z1XVSfCCu/imiRFSvEogNblVYvlg=
X-Gm-Gg: AYBFou1lVQH2/rCNA/6cuBHMwrCJ1+q2RuINvQGLxazeD4bQq51/Ihz+xo8z6sAbWuk
	i7wI/iJjFT+SfkbNroNh5awd0hOQMox4lycOmvNQe8BAn0eSscnZKR5FdwBvKwwxlVHm/hkdi9g
	S6oe3tym/tvZHnJZo8XH/aUpMhnUxYFYuGRMegB4/4LBA9axNh1cqKlAPZ/LdRe/kRbW12O0UeA
	kU0VX9LRaATOaWzIbTXkn0QyYvekSNJF+9XVt/sMe6cVIPU9EG3zlNC/SaH2X7GKzQnfdDtQsZ4
	/im7TfCG/pWZTW1zRwiYpWbD452MxlL4ru9bFKV6Mci0WfDlbFVoug+L
X-Received: by 2002:a05:690c:6087:b0:8b0:da84:d1c1 with SMTP id
 00721157ae682-8b0f1f1a89fmr50010287b3.0.1792447001503; Mon, 19 Oct 2026
 14:56:41 -0700 (PDT)
Received: from 658150881093 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 16:56:41 -0500
Received: from 658150881093 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 16:56:41 -0500
From: Dan Person <it@carboniste.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CABZx5Lu3ShYsPtEsKFfL+Ch6G6KywH9eZ8e=YDYgJqu-k33kJw@mail.gmail.com>
References: <CABZx5Lu3ShYsPtEsKFfL+Ch6G6KywH9eZ8e=YDYgJqu-k33kJw@mail.gmail.com>
Date: Mon, 19 Oct 2026 16:56:41 -0500
X-Gm-Features: AclHuK_L8gKWrmqgSiS8AR93-eVN6EwDlvmWSGt_6EHD3gKd8pPByh9qH28A9RE
Message-ID: <CABZx5LtgeKWUj70LkVaibOEV1ftqi7d=BYE_ug6MdvVxhiCL9Q@mail.gmail.com>
Subject: [PATCH 2/2] media: ipu-bridge: Add OmniVision OV9234
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add the OmniVision OV9234 (ACPI OVTI9234), used as the IR camera of the
Lenovo ThinkPad X1 Carbon Gen 11. It uses one data lane with a 180 MHz
link frequency.

Signed-off-by: Dan Person <it@carboniste.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c
b/drivers/media/pci/intel/ipu-bridge.c
index 32cc95a..b0bef21 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -93,6 +93,8 @@ static const struct ipu_sensor_config
ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
 	/* Omnivision OV8856 */
 	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
+	/* Omnivision OV9234 */
+	IPU_SENSOR_CONFIG("OVTI9234", 1, 180000000),
 	/* Sony IMX471 */
 	IPU_SENSOR_CONFIG("SONY471A", 1, 200000000),
 	/* Toshiba T4KA3 */
-- 
2.53.0
