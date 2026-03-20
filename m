Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD028364933
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 08:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773996430; cv=none; b=PUC+nnejyyIqmszbtUC4Mp3MBufbNDNd6lxNlbjjWmXKTPu9n3DneWFH/8g/a/ITHlseHLEgozbpTJLjOmlY80Td7ZeAZY1pt3IkDf5RzsxM52j5ou+iz2RV8bDMWFg6Icc2YMZP/jrnRhlCps59gVtuUFvXlW8j41SCNACeyKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773996430; c=relaxed/simple;
	bh=9RMSBBDisw9P070cCtuLn1iEhzS8dAyS6V/EOVGDRsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p792DeIGGXtgDuaSnqf+hyr2LDxAvx7lr2yqOCQewi0owTe7t9yuwmwVHTlyX3FU5PX6L/8x9sKAnQP5Q4JKtolkg4PMNmVFWQOw99H1Yx2E80RiUYYEHMX/sQsuF1DjiZ1GGDI8xr3aIboxSeDZfQtnhEJVdoo3wNrS22n7oZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lYj6/zyy; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lYj6/zyy"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b8f97c626aaso279921866b.2
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 01:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996427; x=1774601227; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zwaVx+qXNCKtJhgXPijIGjUexTbsIRMP9q0zzwP2cM=;
        b=lYj6/zyyNbYG5Bgy99lxxzUC0AAqYYoggvYdpjZxUxGgtObduVUe30U/rhFNWoa9S/
         X0G/+l6kZ+fBd5tjRLWBYwjKXx7Ckk6xRbOf6j+M7adgrLri5Pba/AvizaY7Q+aJxh4D
         CwsxujDedKxKETeXXVAKj68Qr3L2biYWb/iVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996427; x=1774601227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7zwaVx+qXNCKtJhgXPijIGjUexTbsIRMP9q0zzwP2cM=;
        b=hFrymy1vfFgYivrITVntTys/asFO6q//eMpzt6bhxEbPweBv+QO5tbkhmRqo8ybVoh
         Xr8wrWPsyVshXJvKeXEjDQzhSGS/DzaNvJykeKyI3mT/zMY3HMi8w8v40WesZi+KK+Dp
         IPQge5LXxqHyPdFE/dgVOrCxsDpV29L94W5hs9hBpd2v5LZK7NUcwPBDaKLx/VVG/qWd
         7o+5WhSjhNuPHqVZxGUnI1uliDCkq9XSz73WCtg1JEUlKdYF0OZ7hPOIpD954Ngn+AWs
         fgCwM9pgfDChvKr3aYi71E1XGtYQUmW4m/lvhVhyqEsSkDvEFBxU2UkpOukSw5PqWQ1p
         sLaQ==
X-Gm-Message-State: AOJu0YzrvzoyNlUo+QekBQLPIENVVC2vXzY9yPzaXn6E6NunCxivyGyN
	t1puk6iOfznAtcHCYfbKAbQfABqX0dKENnBfK/Geca3KDlNJmde3SsEWoE7PEii1W0slO/BaoR9
	Togi04vsq
X-Gm-Gg: ATEYQzzPbFtJPcTGuKYWL4n1niugsrsxkFCovuwoY5UkaDrvCtpW9Je99MRk84A499i
	2wJ1MKkB/Oe7m2aTW5tqP0y2tMGtsqKUW7WMlUmtP0P2prCVeYx/mFG7euMzQdHgOK6czCyVSGZ
	GK8OUJHQSb1+dO4oXa+UqdbhSHdbWvuGbH/GGUO+Dy0lhMh2q+Tte/SUgilgDnOkt0CuUjqZM3s
	J32A2+PvJ4hRBeygSttEtoJSd4w/GQcFDFEx7tbYUFora2b4KWxedMqNDtfP4l2ldYe6uUDawWk
	0CC/XaIpUydTTb9xSh8kbZmg5SpHiG0xR9M0CnbPD1Vni5EbXDWd9fHFD+2WpQCSK+/eD6+BodX
	UTCykki4spBpdBQ1rSM9MrUTgQou6KkA/cfZm3T8LuBGuG7M6eAFHERsnl+l6XmZPj1ogvRx0L0
	GstACiSJLvOzCT4Li6CsbRfefyh6A8DStXF+r982ag+7OW54h4RM8eP4Pf8NoF
X-Received: by 2002:a17:906:c284:b0:b94:1bd:13fa with SMTP id a640c23a62f3a-b982f248bc8mr105291466b.21.1773996426648;
        Fri, 20 Mar 2026 01:47:06 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f440f2sm127322066b.5.2026.03.20.01.47.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 01:47:05 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8f97c626aaso279918066b.2
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 01:47:05 -0700 (PDT)
X-Received: by 2002:a17:907:158a:b0:b98:2c44:6631 with SMTP id
 a640c23a62f3a-b982f21dc70mr98588766b.14.1773996424998; Fri, 20 Mar 2026
 01:47:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABVreWJdZU1VGp+9yDRPZLdDqvE907QP7njh=Jk_OSD0FioBwA@mail.gmail.com>
 <CANiDSCvTafdPD5dQxqEncu0W7XzS-1DBHtz+-nc+W64z_9Q6cQ@mail.gmail.com> <CABVreWLTrzUtWn2mnbsnuAMq97345F=pWDc23SQCeZYVNxmt-g@mail.gmail.com>
In-Reply-To: <CABVreWLTrzUtWn2mnbsnuAMq97345F=pWDc23SQCeZYVNxmt-g@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 20 Mar 2026 09:46:52 +0100
X-Gmail-Original-Message-ID: <CANiDSCtBOJzDb7PJo4jRqYqGzGOenFpO5kV-AmnL7BXWy01v+w@mail.gmail.com>
X-Gm-Features: AaiRm50YnJ6AI_JkNrFYK2upNok8fywGST94zQ1VdygP90RkCgtF4qhAP61Fxlk
Message-ID: <CANiDSCtBOJzDb7PJo4jRqYqGzGOenFpO5kV-AmnL7BXWy01v+w@mail.gmail.com>
Subject: Re: Unable to get Realtek Webcam Working
To: Dennis and Linda Willmott <dennislindawillmott@gmail.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 19 Mar 2026 at 14:44, Dennis and Linda Willmott
<dennislindawillmott@gmail.com> wrote:
>
> Hi Ricardo
> Thanks for your quick response.
>
> I found my problem.  There is a shutter that covers the lens that I never=
 realized was there.  The shutter is hidden above the camera.   Google meet=
 displayed the information "Camera might be blocked.  Check your camera's p=
rivacy switch and remove anything that is covering the camera lens."  That =
led me to discover the shutter.
>

Glad it worked :) At least the shutter was close to the camera itself.
I have seen some privacy switches by the power switch :)

Regards!

> Thanks for all your time.
> Dennis
>
> On Tue, Mar 17, 2026 at 5:31=E2=80=AFPM Ricardo Ribalda <ribalda@chromium=
.org> wrote:
>>
>> Hi Dennis
>>
>> Thanks for the logs. I have not seen anything particularly wrong
>> there. But most of the early log has been lost. Maybe you could do
>> something like:
>>
>> dmesg -c
>> rmmod uvcvideo
>> modprobe uvcvideo trace=3D0xffffffff
>> yavta --capture=3D4 -F /dev/video0
>> dmesg > dmesg.log
>> And then inspect the log and the  frameXXX.bin files
>>
>>
>> Have you tried the camera with other apps like Google Meet/qv4l2?
>> Maybe cheese is being a bit stubborn?
>>
>> Regards
>>
>> On Tue, 17 Mar 2026 at 21:27, Dennis and Linda Willmott
>> <dennislindawillmott@gmail.com> wrote:
>> >
>> > I have a Dell Latitude 5550 running Ubuntu 24.04 LTS.  I am unable to =
get the internal webcam to work.   The webcam is not in the supported list =
at https://www.ideasonboard.org/uvc/
>> >
>> > The device id is 0bda:557b.   Attached to this email are the outputs f=
rom
>> > lsusb -d  0bda:557b -v > lsusb.log 2>lsusb.stderr
>> >
>> > To troubleshoot this, I did the following:
>> >
>> > sudo echo 0xffff > /sys/module/uvcvideo/parameters/trace
>> > Start cheese from a terminal.  The cheese window shows a camera with a=
 slash through it.   See cheese.jpeg
>> > sudo echo 0 > /sys/module/uvcvideo/parameters/trace
>> > dmesg > dmesg.log
>> >
>> >
>>
>>
>> --
>> Ricardo Ribalda



--=20
Ricardo Ribalda
