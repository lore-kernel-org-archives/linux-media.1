Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB150568FB0
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 14:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964102; cv=none; b=m9vWmSOKy9bf+Fk154PgQbPraLf0dzjJHXA59amY76swfK30rBmy5MxgWLnoFXJkoyL1iDEt4f8h9syBDe8ZLCxieWDdoH4ipblA/ZgBU67KP/+iFEx+XKSz7jA/+Jy0FbNrokQfwgnvkdsum3qIoAmTlAAo6CmKncdxEExovkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964102; c=relaxed/simple;
	bh=uNnvflnRGrMVpKn4wzIEE+tR7sJBrJT3OzRMWxR7EDk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XApzebu3OkSy7EUtT1iOHblN6A00OStYm1xyLjgVIt5F1SEPvcBENwgGdEuBLX3rq2KqyGAHdNUMWMV3hpjt9Oz+NVcV9P3jPCGahu+Mi5WUA3wk+5PuNV8iENyZOP0Zw6DNedHnHpuqQE+JRrfzpyVeczhOoz2EJuifLZ3ueso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m9HcvTPh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m9HcvTPh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF251F00A3D;
	Wed,  9 Sep 2026 14:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788964100;
	bh=u9kd1+NGkU7FzEr/WcFgY6xGoTK4CJ278ksJvxE6RnU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=m9HcvTPhvp7x7c9or6FA8Xuwr2V8DcCPhpmrAgIrwaDStHNGDc8fvh2CGsc3I59pU
	 rrhJJojONRMYkE+QMFnR6H+illxdLwmtlNPbBOt/eSNYjeLfsfI/SRjdQegVlTCnr9
	 clTwhk7fa1rwR+epnBKh+u2qw3e6LE7RGQD/Eux2eG8GIIYjSIiT5lcjWuTUFbWEPO
	 66RGUnO3soM5yKfT/UkT53RP+tzuBmkTCv8qXTWuRCe0jqPLbktlOUvs4B5pd9Hcvo
	 vBOsMVFW1CHVhA0/ZdiEjxGsim/GElyCv74qOLl/mg3cp8vBXs+J0SE3zx1rUzA9wc
	 JgWU+hwi2/WQg==
Message-ID: <a0b95ba3-c75c-4843-b2ab-b7f94571c084@kernel.org>
Date: Wed, 9 Sep 2026 16:28:17 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hverkuil+cisco@kernel.org
Subject: Re: [PATCH v4l-utils] v4l2-compliance: Add an option to override the
 driver name
To: Brian Daniels <briandaniels@google.com>, linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260528163448.4031965-1-briandaniels@google.com>
 <CAD4i_GRm4=0vTkpnwx6yrcha1YTgeQR0H39JRqi0PZN4TxwqUA@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CAD4i_GRm4=0vTkpnwx6yrcha1YTgeQR0H39JRqi0PZN4TxwqUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Brian,

Apologies for the delay, it's been very busy and v4l-utils patches are low priority.

On 28/08/2026 16:38, Brian Daniels wrote:
> CCing some more people to hopefully start the discussion. Thanks!
> 
> On Thu, May 28, 2026 at 12:35 PM Brian Daniels <briandaniels@google.com> wrote:
>>
>> When using the virtio-media driver, the host and a guest VM are used,
>> with the guest VM proxying requests to a host device. The driver name in
>> the guest VM is reported as "virtio-media", when really its proxying
>> requests to a driver with a different name (for example, "uvcvideo").
>> For the test to pass, v4l2-compliance needs to know the driver name of
>> the device on the host because it changes its behavior depending on the
>> driver under test.
>>
>> With this new option, the name of the host driver can be passed in on
>> the command line so the test running in the guest can adapt accordingly.
>>
>> Assisted-by: Gemini CLI:gemini-3.1-pro
>> Signed-off-by: Brian Daniels <briandaniels@google.com>
>> ---
>>  utils/v4l2-compliance/v4l2-compliance.cpp | 17 +++++++++++++++++
>>  utils/v4l2-compliance/v4l2-compliance.h   | 15 ++++++++++++++-
>>  2 files changed, 31 insertions(+), 1 deletion(-)
>>
>> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
>> index 4e5c9d00..ddb4e7a7 100644
>> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
>> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
>> @@ -52,6 +52,7 @@ enum Option {
>>         OptHelp = 'h',
>>         OptSetMediaDevice = 'm',
>>         OptSetMediaDeviceOnly = 'M',
>> +       OptDriverName = 'N',
>>         OptNoWarnings = 'n',
>>         OptNoProgress = 'P',
>>         OptSetRadioDevice = 'r',
>> @@ -87,6 +88,7 @@ bool exit_on_warn;
>>  bool is_vivid;
>>  bool is_uvcvideo;
>>  int media_fd = -1;
>> +std::string override_driver_name;
>>  unsigned warnings;
>>  bool has_mmu = true;
>>
>> @@ -130,6 +132,7 @@ static struct option long_options[] = {
>>         {"help", no_argument, nullptr, OptHelp},
>>         {"verbose", no_argument, nullptr, OptVerbose},
>>         {"color", required_argument, nullptr, OptColor},
>> +       {"driver-name", required_argument, nullptr, OptDriverName},
>>         {"no-warnings", no_argument, nullptr, OptNoWarnings},
>>         {"no-progress", no_argument, nullptr, OptNoProgress},
>>         {"exit-on-fail", no_argument, nullptr, OptExitOnFail},
>> @@ -255,6 +258,8 @@ static void usage()
>>         printf("                     then this defaults to 90%%.\n");
>>         printf("  -E, --exit-on-fail Exit on the first fail.\n");
>>         printf("  -h, --help         Display this help message.\n");
>> +       printf("  -N, --driver-name <name>\n");
>> +       printf("                     Override driver name with <name>.\n");
>>         printf("  -C, --color <when> Highlight OK/warn/fail/FAIL strings with colors\n");
>>         printf("                     <when> can be set to always, never, or auto (the default)\n");
>>         printf("  -n, --no-warnings  Turn off warning messages.\n");
>> @@ -1026,6 +1031,15 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
>>                 printf("Compliance test for device ");
>>         else
>>                 printf("Compliance test for %s device ", driver.c_str());
>> +
>> +       struct v4l2_capability real_vcap;
>> +       node.querycap(real_vcap);
>> +
>> +       std::string real_vcap_driver = reinterpret_cast<const char *>(real_vcap.driver);
>> +       if (driver != real_vcap_driver) {
>> +               printf("(overridden from %s) ", real_vcap_driver.c_str());
>> +       }
>> +
>>         printf("%s%s:\n\n", node.device, node.g_direct() ? "" : " (using libv4l2)");
>>
>>         if (node.g_caps() & (V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VBI_CAPTURE |
>> @@ -1811,6 +1825,9 @@ int main(int argc, char **argv)
>>                                 }
>>                         }
>>                         break;
>> +               case OptDriverName:
>> +                       override_driver_name = optarg;
>> +                       break;
>>                 case OptColor:
>>                         if (!strcmp(optarg, "always"))
>>                                 show_colors = true;
>> diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
>> index 4a7af5f5..563075c6 100644
>> --- a/utils/v4l2-compliance/v4l2-compliance.h
>> +++ b/utils/v4l2-compliance/v4l2-compliance.h
>> @@ -311,7 +311,20 @@ static inline double fract2f(const struct v4l2_fract *f)
>>         return (double)f->numerator / (double)f->denominator;
>>  }
>>
>> -#define doioctl(n, r, p) v4l_named_ioctl((n)->g_v4l_fd(), #r, r, p)
>> +extern std::string override_driver_name;
>> +
>> +inline int wrapped_doioctl(struct node *n, const char *name, unsigned long cmd, void *arg)
>> +{
>> +       int retval = v4l_named_ioctl(n->g_v4l_fd(), name, cmd, arg);
>> +       if (retval == 0 && cmd == VIDIOC_QUERYCAP && arg != nullptr && !override_driver_name.empty()) {
>> +               struct v4l2_capability *cap = (struct v4l2_capability *)arg;
>> +               strncpy((char *)cap->driver, override_driver_name.c_str(), sizeof(cap->driver) - 1);
>> +               cap->driver[sizeof(cap->driver) - 1] = '\0';
>> +       }
>> +       return retval;
>> +}
>> +
>> +#define doioctl(n, r, p) wrapped_doioctl(n, #r, r, p)

Ah, this I don't like. There really is just one place where the driver name
is checked to modify v4l2-compliance behavior (the start of testNode()), and
that's where this override_driver_name should be used.

Hiding it in this macro is not nice.

Thinking it over, it might be better to just introduce two option: --is-vivid and
--is-uvcvideo instead of hacking the driver name. If provided, then v4l2-compliance
should just act as if it was a vivid/uvcvideo driver. Those are the only two special
cases at the moment.

Regards,

	Hans

>>
>>  const char *ok(int res);
>>  int check_string(const char *s, size_t len);
>>
>> base-commit: f2a3cb8a59bcce9ac9f7a7c5b71429610d638a12
>> --
>> 2.54.0.794.g4f17f83d09-goog
>>
> 

